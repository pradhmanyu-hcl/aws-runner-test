#vpc
module "vpc" {
  source = "./vpc"
  vpc_cidr = var.vpc_cidr
  vpc_sec_cidr = var.vpc_sec_cidr
  role_name = var.role_name
  loggroup_name = var.loggroup_name
  retention_days = var.retention_days
  vpc_tags = var.vpc_tags
  flow_logs_tags = var.flow_logs_tags
  iam_policy = var.iam_policy
}

#subnet
module "subnet" {
  source = "./subnet"
  availability_zone = var.availability_zone
  vpc_id = module.vpc.vpc
  depends_on = [ module.vpc.vpc_sec_cidr ]
  pusnet_cidr = var.pusnet_cidr
  prsnet_cidr = var.prsnet_cidr
  dbsnet_cidr = var.dbsnet_cidr
  pusnet_tags = var.pusnet_tags
  prsnet_tags = var.prsnet_tags
  dbsnet_tags = var.dbsnet_tags
}

#igw
module "igw" {
  source = "./igw"
  vpc_id = module.vpc.vpc
  igw_tags = var.igw_tags
}

#natgw
module "natgw" {
  source = "./natgw"
  availability_zone = var.availability_zone
  eip_tags = var.eip_tags
  subnet_id = module.subnet.pusnet
  depends_on = [ module.vpc.vpc_sec_cidr ]
  nat_tags = var.nat_tags
}

#ec2 rails
module "ec2_rails" {
  source = "./ec2_rails"
  sgec2_name = var.sgec2_name
  vpc_id = module.vpc.vpc
  sgec2_ingress_from_port = var.sgec2_ingress_from_port
  sgec2_ingress_to_port = var.sgec2_ingress_to_port
  sgec2_ingress_protocol = var.sgec2_ingress_protocol
  sgec2_egress_from_port = var.sgec2_egress_from_port
  sgec2_egress_to_port = var.sgec2_egress_to_port
  sgec2_egress_protocol = var.sgec2_egress_protocol
  sgec2_tags = var.sgec2_tags
  vpc_cidr = var.vpc_cidr
  ami = var.ami
  ssmrole_name = var.ssmrole_name
  instance_profile = var.instance_profile
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  subnet_id = module.subnet.prsnet
  delete_on_termination = var.delete_on_termination
  ec2_tags = var.ec2_tags
  launch_conf_name_rails = var.launch_conf_name_rails
  autoscaling_group_name_rails = var.autoscaling_group_name_rails
  min_size_rails = var.min_size_rails
  max_size_rails = var.max_size_rails
  health_check_grace_period_rails = var.health_check_grace_period_rails
  force_delete_rails = var.force_delete_rails
  health_check_type_rails = var.health_check_type_rails
  ebs_volume_size = var.rails_ebs_volume_size
}

#ec2 praefect
module "ec2_praefect" {
  source = "./ec2_praefect"
  sgec2_praefect_name = var.sgec2_praefect_name
  vpc_id = module.vpc.vpc
  sgec2_praefect_ingress_from_port = var.sgec2_praefect_ingress_from_port
  sgec2_praefect_ingress_to_port = var.sgec2_praefect_ingress_to_port
  sgec2_praefect_ingress_protocol = var.sgec2_praefect_ingress_protocol
  sgec2_praefect_egress_from_port = var.sgec2_praefect_egress_from_port
  sgec2_praefect_egress_to_port = var.sgec2_praefect_egress_to_port
  sgec2_praefect_egress_protocol = var.sgec2_praefect_egress_protocol
  sgec2_praefect_tags = var.sgec2_praefect_tags
  vpc_cidr = var.vpc_cidr
  availability_zone = var.availability_zone
  praefect_ami = var.praefect_ami
  praefect_instance_type = var.praefect_instance_type
  praefect_delete_on_termination = var.praefect_delete_on_termination
  ssmpraefectrole_name = var.ssmpraefectrole_name
  instance_profile_praefect = var.instance_profile_praefect
  subnet_id = module.subnet.prsnet
  ec2praefect_tags = var.ec2praefect_tags
  launch_conf_name_praefect = var.launch_conf_name_praefect
  autoscaling_group_name_praefect = var.autoscaling_group_name_praefect
  min_size_praefect = var.min_size_praefect
  max_size_praefect = var.max_size_praefect
  health_check_grace_period_praefect = var.health_check_grace_period_praefect
  force_delete_praefect = var.force_delete_praefect
  health_check_type_praefect = var.health_check_type_praefect
  ebs_volume_size = var.praefect_ebs_volume_size
}

# #ec2 gitlay
module "ec2_gitlay" {
  source = "./ec2_gitlay"
  sgec2_gitlay_name = var.sgec2_gitlay_name
  sgec2_gitlay_tags = var.sgec2_gitlay_tags
  vpc_id = module.vpc.vpc
  sgec2_gitlay_ingress_from_port = var.sgec2_gitlay_ingress_from_port
  sgec2_gitlay_ingress_to_port = var.sgec2_gitlay_ingress_to_port
  sgec2_gitlay_ingress_protocol = var.sgec2_gitlay_ingress_protocol
  sgec2_gitlay_egress_from_port = var.sgec2_gitlay_egress_from_port
  sgec2_gitlay_egress_to_port = var.sgec2_gitlay_egress_to_port
  sgec2_gitlay_egress_protocol = var.sgec2_gitlay_egress_protocol
  vpc_cidr = var.vpc_cidr
  availability_zone = var.availability_zone
  gitlay_ami = var.gitlay_ami
  gitlay_instance_type = var.gitlay_instance_type
  gitlay_delete_on_termination = var.gitlay_delete_on_termination
  ssmgitlayrole_name = var.ssmgitlayrole_name
  instance_profile_gitlay = var.instance_profile_gitlay
  subnet_id = module.subnet.prsnet
  ec2gitlay_tags = var.ec2gitlay_tags
  ebs_volume_size = var.gitlay_ebs_volume_size
}


#alb rails
module "alb_rails" {
  source = "./alb_rails"
  sgalb_name = var.sgalb_name
  vpc_id = module.vpc.vpc
  sgalb_tags = var.sgalb_tags
  sgalb_type = var.sgalb_type
  sgalb_from_port = var.sgalb_from_port
  sgalb_to_port = var.sgalb_to_port
  sgalb_protocol = var.sgalb_protocol
  vpc_cidr = var.vpc_cidr
  alb_name = var.alb_name
  alb_tags = var.alb_tags
  enable_deletion_protection = var.enable_deletion_protection
  subnets = module.subnet.pusnet
  listener_port = var.listener_port
  listener_protocol = var.listener_protocol
  alb_tg_name = var.alb_tg_name
  availability_zone = var.availability_zone
  tg_port = var.tg_port
  tg_protocol = var.tg_protocol
  healthy_threshold = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold
  timeout = var.timeout
  target_id = module.ec2_rails.ec2
}


# main.tf

module "alb_praefect" {
  source                               = "./alb_praefect"
  sgnlb_praefect_name                  = var.sgnlb_praefect_name
  vpc_id                               = module.vpc.vpc
  sgnlb_praefect_tags                  = var.sgnlb_praefect_tags
  sgnlb_praefect_type                  = var.sgnlb_praefect_type
  sgnlb_praefect_from_port             = var.sgnlb_praefect_from_port
  sgnlb_praefect_to_port               = var.sgnlb_praefect_to_port
  sgnlb_praefect_protocol              = var.sgnlb_praefect_protocol
  vpc_cidr                             = var.vpc_cidr
  nlb_praefect_name                    = var.nlb_praefect_name
  nlb_praefect_tags                    = var.nlb_praefect_tags
  praefect_enable_deletion_protection = var.praefect_enable_deletion_protection
  subnets                              = module.subnet.pusnet
  listener_praefect_port               = var.listener_praefect_port
  listener_praefect_protocol           = var.listener_praefect_protocol
}


#rds
module "rds_gitlab" {
  source = "./rds_gitlab"
  vpc_id = module.vpc.vpc
  sgrds_name = var.sgrds_name
  sgrds_tags = var.sgrds_tags
  sgrds_type = var.sgrds_type
  sgrds_from_port = var.sgrds_from_port
  sgrds_to_port = var.sgrds_to_port
  sgrds_protocol = var.sgrds_protocol
  vpc_cidr = var.vpc_cidr
  subnet_group_name = var.subnet_group_name
  subnet_group_desc = var.subnet_group_desc
  subnet_ids = module.subnet.dbsnet
  parameter_group_name = var.parameter_group_name
  parameter_group_desc = var.parameter_group_desc
  family = var.family
  rds_role = var.rds_role
  identifier = var.identifier
  allocated_storage = var.allocated_storage
  db_name = var.db_name
  db_instance_class = var.db_instance_class
  engine = var.engine
  engine_version = var.engine_version
  skip_final_snapshot = var.skip_final_snapshot
  storage_type = var.storage_type
  storage_encrypted = var.storage_encrypted
  multi_az = var.multi_az
  username = var.username
  password = var.password
  backup_window = var.backup_window
  maintenance_window = var.maintenance_window
  performance_insights_enabled = var.performance_insights_enabled
  db_retention_days = var.db_retention_days
  db_log_retention = var.db_log_retention
  monitoring_interval = var.monitoring_interval
  rds_tags = var.rds_tags
}

#rds praefect
module "rds_praefect" {
  source = "./rds_praefect"
  vpc_id = module.vpc.vpc
  sgrds_praefect_name = var.sgrds_praefect_name
  sgrds_praefect_tags = var.sgrds_praefect_tags
  sgrds_praefect_type = var.sgrds_praefect_type
  sgrds_praefect_from_port = var.sgrds_praefect_from_port
  sgrds_praefect_to_port = var.sgrds_praefect_from_port
  sgrds_praefect_protocol = var.sgrds_praefect_protocol
  vpc_cidr = var.vpc_cidr
  subnet_group_name_praefect = var.subnet_group_name_praefect
  subnet_group_desc_praefect = var.subnet_group_desc_praefect
  subnet_ids = module.subnet.prsnet
  parameter_group_name_praefect = var.parameter_group_name_praefect
  parameter_group_desc_praefect = var.parameter_group_desc_praefect
  family_praefect = var.family_praefect
  rdspraefect_role = var.rdspraefect_role
  identifier_praefect = var.identifier_praefect
  allocated_storage_praefect = var.allocated_storage_praefect
  db_name_praefect = var.db_name_praefect
  db_instance_class_praefect = var.db_instance_class_praefect
  engine_praefect = var.engine_praefect
  engine_version_praefect = var.engine_version_praefect
  skip_final_snapshot_praefect = var.skip_final_snapshot_praefect
  storage_type_praefect = var.storage_type_praefect
  storage_encrypted_praefect = var.storage_encrypted_praefect
  multi_az_praefect = var.multi_az_praefect
  username_praefect = var.username_praefect
  password_praefect = var.password_praefect
  backup_window_praefect = var.backup_window_praefect
  maintenance_window_praefect = var.maintenance_window_praefect
  performance_insights_enabled_praefect = var.performance_insights_enabled_praefect
  db_retention_days_praefect = var.db_retention_days_praefect
  db_log_retention_praefect = var.db_log_retention_praefect
  monitoring_interval_praefect = var.monitoring_interval_praefect
  rdspraefect_tags = var.rdspraefect_tags
}

#elasticache
module "elasticache" {
  source = "./elasticache"
  sgelc_name = var.sgelc_name
  vpc_id = module.vpc.vpc
  sgelc_ingress_from_port = var.sgelc_ingress_from_port
  sgelc_ingress_to_port = var.sgelc_ingress_to_port
  sgelc_ingress_protocol = var.sgelc_ingress_protocol
  sgelc_egress_from_port = var.sgelc_egress_from_port
  sgelc_egress_to_port = var.sgelc_egress_to_port
  sgelc_egress_protocol = var.sgelc_egress_protocol
  vpc_cidr = var.vpc_cidr
  cache_subnet_group_name = var.cache_subnet_group_name
  subnet_ids = module.subnet.dbsnet
  replication_group_id = var.replication_group_id
  rep_description = var.rep_description
  automatic_failover_enabled = var.automatic_failover_enabled
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled
  multi_az_enabled = var.multi_az_enabled
  cache_engine = var.cache_engine
  cache_port = var.cache_port
  node_type = var.node_type
  num_cache_nodes = var.num_cache_nodes
  parameter_group = var.parameter_group
  snapshot_retention_limit = var.snapshot_retention_limit
  snapshot_window = var.snapshot_window
}