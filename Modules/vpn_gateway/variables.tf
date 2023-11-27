variable "vpc_id" {
  description = "vpc id for the gateway"
  type = string
  default = ""
}
variable "bgp_asn" {
  description = "asn for customer gateway"
  type = number
  default = 65000
}
variable "ip_address" {
  description = "ip address of the customer gateway"
  type = string
  default = "8.8.8.8"
}
variable "type" {
  description = "type of customer gateway"
  type = string
  default = "ipsec.1"
}
variable "vpn_gateway_tags" {
  description = "tags asssociated to vpn gateway"
  type = string
  default = "awsgov_vgw_usw_ccoe_prd_001"
}
variable "customer_gateway_tags" {
  description = "tags associated to customer gateway"
  type = string
  default = "awsgov_cgw_usw_ccoe_prd_001"
}