region       = "us-west-2"

#vpc
vpc_cidr     = "172.0.0.0/16"
vpc_sec_cidr = "10.0.0.0/16"
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