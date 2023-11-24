#Vpc
module "vpc" {
  source = "../Modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_sec_cidr = var.vpc_cidr
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

# #Internet Gateway
# module "igw" {
#   source = "../Modules/igw"
#   vpc_id = module.vpc.vpc_id
# }

# #Nat Gateway
# module "nat" {
#   source = "../Modules/nat"
#   subnet_id = module.subnet.pusnet[0]
#   depends_on = [ module.vpc.sec_cidr ]
# }

# #Security Group
# module "sg" {
#   source = "../Modules/sg"
#   vpc_id = module.vpc.vpc_id
# }

# #creating ec2
# module "ec2" {
#   source = "../Modules/ec2"
#   subnet_id = module.subnet.prsnet
#   security_group_id = module.sg.sg_id
# }

# #Creating application load balancer
# module "alb" {
#   source = "../Modules/alb"
#   security_group_id = module.sg.sg_id
#   subnets = module.subnet.pusnet
#   vpc_id = module.vpc.vpc_id
#   target_id = module.ec2.ec2
# }

# #Route tables & associations
# module "route_table" {
#   source = "../Modules/route_table"
#   vpc_id = module.vpc.vpc_id
#   igw = module.igw.igw
#   natgw = module.nat.natgw
#   pusnet_id = module.subnet.pusnet
#   prsnet_id = module.subnet.prsnet
#   dbsnet_id = module.subnet.dbsnet
# }

