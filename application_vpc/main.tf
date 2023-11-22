#Vpc
module "vpc" {
  source = "../Modules/vpc"
}

#Subnets
module "subnet" {
  source = "../Modules/subnet"
  vpc_id = module.vpc.vpc_id
  depends_on = [ module.vpc.sec_cidr ]
}

#Internet Gateway
module "igw" {
  source = "../Modules/igw"
  vpc_id = module.vpc.vpc_id
}

#Nat Gateway
module "nat" {
  source = "../Modules/nat"
  subnet_id = module.subnet.pusnet[0]
  depends_on = [ module.vpc.sec_cidr ]
}

#Security Group
module "sg" {
  source = "../Modules/sg"
  vpc_id = module.vpc.vpc_id
}

#creating ec2
module "ec2" {
  source = "../Modules/ec2"
  subnet_id = module.subnet.prsnet
  security_group_id = module.sg.sg_id
}

#Creating application load balancer
module "alb" {
  source = "../Modules/alb"
  security_group_id = module.sg.sg_id
  subnets = module.subnet.pusnet
  vpc_id = module.vpc.vpc_id
  target_id = module.ec2.ec2
}

#Route tables & associations
module "route_table" {
  source = "../Modules/route_table"
  vpc_id = module.vpc.vpc_id
  igw = module.igw.igw
  natgw = module.nat.natgw
  pusnet_id = module.subnet.pusnet
  prsnet_id = module.subnet.prsnet
  dbsnet_id = module.subnet.dbsnet
}

