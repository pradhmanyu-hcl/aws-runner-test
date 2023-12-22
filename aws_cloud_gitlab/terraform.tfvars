region = "us-west-2"

#vpc
vpc_cidr = "10.0.0.0/16"
vpc_sec_cidr = "172.0.0.0/16"
role_name    = "vpcfl"
loggroup_name = "vpcflowloggroup"
retention_days = 365
vpc_tags = "awsgov_vpc_usw_ccoe_prd_001"
flow_logs_tags = "awsgov_vpcfl_usw_ccoe_prd_001"
iam_policy     = "vpcflpolicy"

#subnet
availability_zone = [ "us-west-2a","us-west-2b" ]
pusnet_cidr = [ "172.0.1.0/24","172.0.2.0/24" ]
prsnet_cidr = [ "10.0.1.0/24","10.0.3.0/24" ]
dbsnet_cidr = [ "10.0.4.0/24","10.0.5.0/24" ]
pusnet_tags = [ "awsgov_pusnet1_usw_ccoe_prd_001","awsgov_pusnet2_usw_ccoe_prd_001" ]
prsnet_tags = [ "awsgov_prsnet1_usw_ccoe_prd_001","awsgov_prsnet2_usw_ccoe_prd_001" ]
dbsnet_tags = [ "awsgov_dbsnet1_usw_ccoe_prd_001","awsgov_dbsnet2_usw_ccoe_prd_001" ]

#igw
igw_tags = "awsgov_igw_usw_ccoe_prd_001"

#natgw
eip_tags = [ "awsgov_eip1_usw_ccoe_prd_001","awsgov_eip2_usw_ccoe_prd_001"]
nat_tags = [ "awsgov_natgw1_usw_ccoe_prd_001","wsgov_natgw2_usw_ccoe_prd_001" ]

#ec2 rails
sgec2_name = "Ec2-Rails-security-group"
sgec2_ingress_from_port = "22"
sgec2_ingress_to_port = "22"
sgec2_ingress_protocol = "tcp"
sgec2_egress_from_port = "0"
sgec2_egress_to_port = "0"
sgec2_egress_protocol = "-1"
sgec2_tags = "awsgov_sgec2rails_usw_ccoe_prd_001"
ssmrole_name = "rails-ssm-role"
instance_profile = "ec2rails-ssm-profile"
ami = "ami-04b4d3355a2e2a403"
instance_type = "t2.micro"
delete_on_termination = false
ec2_tags = [ "awsec2l1","awsec2l2" ]
launch_conf_name_rails = "ec2-rails-launch-configuration"
autoscaling_group_name_rails = "ec2-rails-asg"
min_size_rails = 2
max_size_rails = 5
health_check_grace_period_rails = 300
force_delete_rails = true
health_check_type_rails = "EC2"
ebs_volume_size = 50

#ec2 praefect
sgec2_praefect_name = "Ec2-Praefect-Security_group"
sgec2_praefect_ingress_from_port = "22"
sgec2_praefect_ingress_to_port = "22"
sgec2_praefect_ingress_protocol = "tcp"
sgec2_praefect_egress_from_port = "0"
sgec2_praefect_egress_to_port = "0"
sgec2_praefect_egress_protocol = "-1"
sgec2_praefect_tags = "awsgov_sgec2praefect_usw_ccoe_prd_001"
ssmpraefectrole_name = "prafect-ssm-role"
instance_profile_praefect = "ec2praefect-ssm-profile"
praefect_ami = "ami-04b4d3355a2e2a403"
praefect_instance_type = "t2.micro"
praefect_delete_on_termination = false
ec2praefect_tags = [ "awsec2lpraefect1","awsec2lpraefect2" ]
launch_conf_name_praefect = "ec2-praefect-launch-configuration"
autoscaling_group_name_praefect = "ec2-praefect-asg"
min_size_praefect = 2
max_size_praefect = 5
health_check_grace_period_praefect = 300
force_delete_praefect = true
health_check_type_praefect = "EC2"
ebs_volume_size = 50

#alb rails
sgalb_name = "Rails-Alb-Security-Group"
sgalb_tags = "awsgov_sgalbrails_usw_ccoe-prd_001"
sgalb_type = "ingress"
sgalb_from_port = "80"
sgalb_to_port = "80"
sgalb_protocol = "tcp"
alb_name = "rails-application-load-balancer"
alb_tags = "awsgov_albrails_usw_ccoe_prd_001"
enable_deletion_protection = false
listener_port = "80"
listener_protocol = "HTTP"
alb_tg_name = "albrails-target-group"
tg_port = "80"
tg_protocol = "HTTP"
healthy_threshold = 2
unhealthy_threshold = 2
timeout = 3

#alb praefect
sgnlb_praefect_name = "Praefect-Alb-Security Group"
sgnlb_praefect_tags = "awsgov_sgalpraefect_usw_ccoe-prd_001"
sgnlb_praefect_type = "ingress"
sgnlb_praefect_from_port = "80"
sgnlb_praefect_to_port = "80"
sgnlb_praefect_protocol = "tcp"
nlb_praefect_name = "praefect-application-lb"
nlb_praefect_tags = "awsgov_albpraefect_usw_ccoe_prd_001"
praefect_enable_deletion_protection = false
listener_praefect_port = "2305"
listener_praefect_protocol = "TCP"
/*alb_tg_praefect_name = "albpraefect-target-group"
tg_praefect_port = "80"
tg_praefect_protocol = "HTTP"
praefect_healthy_threshold = 2
praefect_unhealthy_threshold = 2
praefect_timeout = 3*/


#rds gitlab
sgrds_name = "Rds-Gitlab-Security-Group"
sgrds_tags = "awsgov_sgrdsgitlab_usw_ccoe_prd_001"
sgrds_type = "ingress"
sgrds_from_port = "5432"
sgrds_to_port = "5432"
sgrds_protocol = "tcp"
subnet_group_name = "rds-gitlab-subnetgroup"
subnet_group_desc = "RDS PostgreSql Subnet Group"
parameter_group_name = "rds-gitlab-pg"
parameter_group_desc = "Postgres parameter Group"
family = "postgres14"
rds_role = "rds-gitlab-enhanced-monitoing"
identifier = "rds-postgresql"
allocated_storage = 10
db_name = "gitlabhq_production"
db_instance_class = "db.t3.micro"
engine = "postgres"
engine_version = "14"
skip_final_snapshot = true
storage_type = "gp2"
storage_encrypted = true
multi_az = true
username = "test"
password = "postgres9961"
db_retention_days = 35
backup_window = "03:00-04:00"
maintenance_window = "sun:05:00-sun:06:00"
performance_insights_enabled = true
db_log_retention = 7
monitoring_interval = 30
rds_tags = "awsgov_rdsgitlabpostgresql_usw_ccoe_prd_001"

#rds praefect
sgrds_praefect_name = "Rds-Praefect-Security-Group"
sgrds_praefect_tags = "awsgov_sgrdspraefect_usw_ccoe_prd_001"
sgrds_praefect_type = "ingress"
sgrds_praefect_from_port = "5432"
sgrds_praefect_to_port = "5432"
sgrds_praefect_protocol = "tcp"
subnet_group_name_praefect = "rds-praefect-subnet-group"
subnet_group_desc_praefect = "RDS PostgreSql Subnet Group"
parameter_group_name_praefect = "rds-praefect-pg"
parameter_group_desc_praefect = "Postgres parameter Group"
family_praefect = "postgres14"
rdspraefect_role = "rds-praefect-enhanced-monitoing"
identifier_praefect = "rds-postgresql-preafect"
allocated_storage_praefect = 10
db_name_praefect = "praefect_production"
db_instance_class_praefect = "db.t3.micro"
engine_praefect = "postgres"
engine_version_praefect = "14"
skip_final_snapshot_praefect = true
storage_type_praefect = "gp2"
storage_encrypted_praefect = true
multi_az_praefect = true
username_praefect = "test"
password_praefect = "postgresql9961"
db_retention_days_praefect = 35
backup_window_praefect = "03:00-04:00"
maintenance_window_praefect = "sun:05:00-sun:06:00"
performance_insights_enabled_praefect = true
db_log_retention_praefect = 7
monitoring_interval_praefect = 30
rdspraefect_tags = "awsgov_rdspraefectpostgresql_usw_ccoe_prd_001"

#elasticache
sgelc_name = "Elasticache-security-group"
sgelc_ingress_from_port = "6379"
sgelc_ingress_to_port = "6379"
sgelc_ingress_protocol = "tcp"
sgelc_egress_from_port = "0"
sgelc_egress_to_port = "0"
sgelc_egress_protocol = "-1"
cache_subnet_group_name = "redis-cache-subnet-group"
replication_group_id = "rep-group-redis"
rep_description = "Replication group for redis cluster"
at_rest_encryption_enabled = true
transit_encryption_enabled = true
multi_az_enabled = true
automatic_failover_enabled = true
cache_engine = "redis"
cache_port = 6379
node_type = "cache.m4.large"
num_cache_nodes = 2
parameter_group = "default.redis7"
snapshot_retention_limit = 1
snapshot_window = "10:00-11:00"

