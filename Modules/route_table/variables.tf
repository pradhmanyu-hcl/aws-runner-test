variable "vpc_id" {
  description = "vpc id in which subnet will be created"
  type = string
  default = "value"
}
variable "purt_tags" {
  description = "tags associated to Public route table"
  type = string
  default = "awsgov_purt_usw_ccoe_prd_001"
}
variable "prrt_tags" {
  description = "tags associated to Private route table"
  type = string
  default = "awsgov_prrt_usw_ccoe_prd_001"
}

variable "dbrt_tags" {
  description = "tags associated to database route table"
  type = string
  default = "awsgov_dbrt_usw_ccoe_prd_001"
}
variable "igw" {
  description = "igw id for access to internet for public subnets"
  type = string
  default = ""
}
variable "natgw" {
  description = "nat gw id for private subnets"
  type = string
  default = ""
}
variable "resource_count" {
  description = "Resource count taken for route table associations"
  type = number
  default = 2
}
variable "pusnet_id" {
  description = "public subnet ids to be attached to public rt"
  type = list(string)
  default = [ "","" ]
}
variable "prsnet_id" {
  description = "private subnet ids to be attached to private rt"
  type = list(string)
  default = [ "","" ]
}
variable "dbsnet_id" {
  description = "database subnet ids to be attached to database rt"
  type = list(string)
  default = [ "","" ]
}


