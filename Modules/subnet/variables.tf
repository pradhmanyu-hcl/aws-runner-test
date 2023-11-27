variable "availability_zone" {
  description = "Azs used to create subnets"
  type = list(string)
  default = [ "us-west-2a","us-west-2b" ]
}
variable "vpc_id" {
  description = "vpc id in which subnet will be created"
  type = string
  default = "value"
}
variable "pusnet_cidr" {
  description = "cidr range of public subnets"
  type = list(string)
  default = ["172.0.1.0/24", "172.0.2.0/24"]
}
variable "pusnet_tags" {
  description = "tags associated with public subnet"
  type = list(string)
  default = ["awsgov_pusnet1_usw_ccoe_prd_001","awsgov_pusnet2_usw_ccoe_prd_001"]
}
variable "prsnet_cidr" {
  description = "cidr of private subnet"
  type = list(string)
  default = ["10.0.3.0/24", "10.0.5.0/24"]
}
variable "prsnet_tags" {
  description = "tags associated with Private subnets"
  type = list(string)
  default = [ "awsgov_prsnet1_usw_ccoe_prd_001","awsgov_prsnet2_usw_ccoe_prd_001" ]
}
variable "dbsnet_cidr" {
  description = "cidr of the db subnet"
  type = list(string)
  default = [ "10.0.6.0/24","10.0.7.0/24" ]
}
variable "dbsnet_tags" {
  description = "tags associated with database subnets"
  type = list(string)
  default = ["awsgov_dbsnet1_usw_ccoe_prd_001","awsgov_dbsnet2_usw_ccoe_prd_001"]
}