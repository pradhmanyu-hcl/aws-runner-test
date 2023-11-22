variable "vpc_id" {
  description = "vpc id to which internet gateway to be attached"
  type = string
  default = "value"
}
variable "tags" {
  description = "tag associated to igw"
  type = string
  default = "awsgov_igw_usw_ccoe_prd_001"
}