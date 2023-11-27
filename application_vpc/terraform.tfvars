region       = "us-west-2"

#vpc
vpc_cidr     = "10.0.0.0/16"
vpc_sec_cidr = "172.0.0.0/16"
tags         = "awsgov_vpc_usw_ccoe_prd_001"
role_name    = "vpcfl"
loggroup_name = "vpcflowloggroup"
retention_days = 365
flow_logs_tags = "awsgov_vpcfl_usw_ccoe_prd_001"
iam_policy     = "vpcflpolicy"

#subnet
availability_zone = [ "us-west-2a","us-west-2b" ]
pusnet_cidr = [ "172.0.1.0/24", "172.0.2.0/24" ]
pusnet_tags = [ "awsgov_pusnet1_usw_ccoe_prd_001","awsgov_pusnet2_usw_ccoe_prd_001" ]
prsnet_cidr = [ "10.0.3.0/24", "10.0.5.0/24" ]
prsnet_tags = [ "awsgov_prsnet1_usw_ccoe_prd_001","awsgov_prsnet2_usw_ccoe_prd_001" ]
dbsnet_cidr = [ "10.0.6.0/24","10.0.7.0/24" ]
dbsnet_tags = [ "awsgov_dbsnet1_usw_ccoe_prd_001","awsgov_dbsnet2_usw_ccoe_prd_001" ]

#igw
igw_tags = "awsgov_igw_usw_ccoe_prd_001"

#nat
eip_tags = "awsgov_eip_usw_ccoe_prd_001"
nat_tags = "awsgov_natgw_usw_ccoe_prd_001"

#sg
sg_name = "web-security-group"
ingress_from_port = "22"
ingress_to_port = "22"
ingress_protocol = "tcp"
egress_from_port = "0"
egress_to_port = "0"
egress_protocol = "-1"
sg_tags = "awsgov_sg_usw_ccoe_prd_001"

#ec2
ami = "ami-03f65b8614a860c29"
instance_type = "t2.micro"
delete_on_termination = false
ec2_tags = [ "awsec2l1","awsec2l2" ]

#alb
alb_name = "application-load-balancer"
enable_deletion_protection = false
alb_tags = "aws_alb_usw_ccoe_prd_001"
port = "80"
protocol = "HTTP"
alb_tg_name = "alb-tg"
healthy_threshold = 2
unhealthy_threshold = 2
timeout = 3
resource_count = 2


#route table
purt_tags = "awsgov_purt_usw_ccoe_prd_001"
prrt_tags = "awsgov_prrt_usw_ccoe_prd_001"
dbrt_tags = "awsgov_dbrt_usw_ccoe_prd_001"




