region = "us-gov-west-1"
# #vpc
vpc_cidr = "10.100.193.0/26"
vpc_sec_cidr = "100.64.1.0/24"
role_name    = "vpcflnperole"
loggroup_name = "vpcflowloggroupnpeaccount"
retention_days = 365
vpc_tags = "awsgov_vpc_usw_ccoe_npe_001"
flow_logs_tags = "awsgov_vpcfl_usw_ccoe_npe_001"
iam_policy     = "flpolicy"

# #subnet
#vpc_cidr = "10.100.193.0/26"
availability_zone = [ "us-gov-west-1a","us-gov-west-1b" ]
pusnet_cidr = [ "10.100.193.0/27","10.100.193.32/27" ]
prsnet_cidr = [ "100.64.1.0/27","100.64.1.32/27" ]
dbsnet_cidr = [ "100.64.1.64/27","100.64.1.96/27" ]
pusnet_tags = [ "awsgov_albsnet1_usw_ccoe_npe_001","awsgov_albsnet2_usw_ccoe_npe_001" ]
prsnet_tags = [ "awsgov_prsnet1_usw_ccoe_npe_001","awsgov_prsnet2_usw_ccoe_npe_001" ]
dbsnet_tags = [ "awsgov_dbsnet1_usw_ccoe_npe_001","awsgov_dbsnet2_usw_ccoe_npe_001" ]