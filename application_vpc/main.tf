#Vpc 
module "vpc" {
  source = "../Modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_sec_cidr = var.vpc_sec_cidr
  role_name = var.role_name
  loggroup_name = var.loggroup_name
  retention_days = var.retention_days
  tags = var.tags
  flow_logs_tags = var.flow_logs_tags
  iam_policy = var.iam_policy
}

#Subnets 
module "subnet" {
  source = "../Modules/subnet"
  vpc_id = module.vpc.vpc_id
  depends_on = [ module.vpc.sec_cidr ]
  availability_zone = var.availability_zone
  pusnet_cidr = var.pusnet_cidr
  pusnet_tags = var.pusnet_tags
  prsnet_cidr = var.prsnet_cidr
  prsnet_tags = var.prsnet_tags
  dbsnet_cidr = var.dbsnet_cidr
  dbsnet_tags = var.dbsnet_tags
}

#Internet Gateway
module "igw" {
  source = "../Modules/igw"
  vpc_id = module.vpc.vpc_id
  igw_tags = var.igw_tags
}

#Nat Gateway
module "nat" {
  source = "../Modules/nat"
  subnet_id = module.subnet.pusnet[0]
  depends_on = [ module.vpc.sec_cidr ]
  eip_tags = var.eip_tags
  nat_tags = var.nat_tags
}

#Security Group
module "sg" {
  source = "../Modules/sg"
  vpc_id = module.vpc.vpc_id
  sg_name = var.sg_name
  ingress_from_port = var.ingress_from_port
  ingress_to_port = var.ingress_to_port
  ingress_protocol = var.ingress_protocol
  egress_from_port = var.egress_from_port
  egress_to_port = var.egress_to_port
  egress_protocol = var.egress_protocol
  vpc_cidr = var.vpc_cidr
  sg_tags = var.sg_tags
}

#creating ec2
module "ec2" {
  source = "../Modules/ec2"
  subnet_id = module.subnet.prsnet
  security_group_id = module.sg.sg_id
  availability_zone = var.availability_zone
  ami = var.ami
  instance_type = var.instance_type
  delete_on_termination = var.delete_on_termination
  ec2_tags = var.ec2_tags
}

#Creating application load balancer
module "alb" {
  source = "../Modules/alb"
  security_group_id = module.sg.sg_id
  subnets = module.subnet.pusnet
  vpc_id = module.vpc.vpc_id
  alb_name = var.alb_name
  enable_deletion_protection = var.enable_deletion_protection
  alb_tg_name = var.alb_tg_name
  port = var.port
  protocol = var.protocol
  alb_tags = var.alb_tags
  healthy_threshold = var.healthy_threshold
  unhealthy_threshold = var.unhealthy_threshold
  timeout = var.timeout
  resource_count = var.resource_count
  target_id = module.ec2.ec2
}

#Route tables & associations
module "route_table" {
  source = "../Modules/route_table"
  vpc_id = module.vpc.vpc_id
  igw = module.igw.igw
  natgw = module.nat.natgw
  resource_count = var.resource_count
  pusnet_id = module.subnet.pusnet
  prsnet_id = module.subnet.prsnet
  dbsnet_id = module.subnet.dbsnet
  purt_tags = var.purt_tags
  prrt_tags = var.prrt_tags
  dbrt_tags = var.dbrt_tags
}

