variable "vpc_id" {
  description = "vpc id to connect security group to"
  type = string
}
variable "vpc_cidr" {
  description = "cidr block for vpc to allow traffic on security group"
  type = string
}
variable "sgnlb_praefect_name" {
  description = "security group name for praefect nlb"
  type = string
}
variable "sgnlb_praefect_tags" {
  description = "tags associated with praefect nlb security group"
  type = string
}
variable "sgnlb_praefect_type" {
  description = "Type of traffic allowed on praefect nlb security group"
  type = string
}
variable "sgnlb_praefect_from_port" {
  description = "starting port number to allow on the above traffic type"
  type = string
}
variable "sgnlb_praefect_to_port" {
  description = "ending port number to allow on the above traffic type"
  type = string
}
variable "sgnlb_praefect_protocol" {
  description = "protocol on which the port numbers are allowed"
  type = string
}

variable "nlb_praefect_name" {
  description = "Name of Praefect application load balancer"
  type = string
}
variable "subnets" {
  description = "subnet ids for nlb"
  type = list(string)
}
variable "praefect_enable_deletion_protection" {
  description = "Whether to enable the deletion protection in praefect nlb"
  type = string
}
variable "nlb_praefect_tags" {
  description = "tags associated with praefect nlb"
  type = string
}
variable "listener_praefect_port" {
  description = "listener port for praefect nlb"
  type = string
}
variable "listener_praefect_protocol" {
  description = "listener protocol for prafect nlb"
  type = string
}

