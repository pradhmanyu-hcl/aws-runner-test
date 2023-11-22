variable "eip_tags" {
  description = "tag associated to eip"
  type = string
  default = "awsgov_eip_usw_ccoe_prd_001"
}
variable "subnet_id" {
  description = "Public subnet id in which nat gw is associated"
  type = string
  default = "value"
}
variable "nat_tags" {
  description = "tag associated with nat gw"
  type = string
  default = "awsgov_natgw_usw_ccoe_prd_001"
}