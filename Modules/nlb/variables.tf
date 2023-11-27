variable "nlb_name" {
  description = "Name of the network load balancer"
  type = string
  default = "aws-network-load-balancer"
}
variable "subnets" {
  description = "the subnet ids for nlb."  
  type = list(string)
  default = ["value", "value"]
}
variable "enable_deletion_protection" {
  description = "Whether to enable deletion protection"
  type = bool
  default = false
}
variable "port" {
  description = "port on which nlb will work"
  type = string
  default = "8181"
}
variable "protocol" {
  description = "protocol on which the above port works"
  type = string
  default = "TCP"
}
variable "vpcid" {
  description = "vpc id to which nlb will be attached"
  type = string
  default = "value"
}
variable "nlb_tg_name" {
  description = "Name of the target group for nlb"
  type = string
  default = "nlb-tg"
}
variable "tags" {
  description = "Tag assigned to network load balancer"
  type = string
  default = "awsgov_nlb_usw_ccoe_prd_001"
}
