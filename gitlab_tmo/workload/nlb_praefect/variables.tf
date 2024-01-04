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


variable "praefect_healthy_threshold" {
  description = "healthy threshold value for praefect healthcheck"
  type = number
}
variable "praefect_unhealthy_threshold" {
  description = "Unhealthy threshols value for praefect healthcheck"
  type = number
}
variable "praefect_timeout" {
  description = "timeut period for praefect healthcheck"
  type = number
}
variable "availability_zone" {
  description = "Azs in the required aws region"
  type = list(string)
}
variable "target_id" {
  description = "target ids for nlb. in this case we will be adding ec2 instances"
  type = list(string)
}

variable "nlb_tg_prafect_name" {
  description = "target group name for praefect nlb"
  type = string
}
variable "tg_praefect_port" {
  description = "target group port number for praefect nlb"
  type = string
}
variable "tg_praefect_protocol" {
  description = "target group protocol for praefect nlb"
  type = string
}
