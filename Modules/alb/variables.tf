variable "alb_name" {
  description = "Name of Application load balancer"
  type = string
  default = "application-load-balancer"
}
variable "security_group_id" {
  description = "security group assigned to alb"
  type = string
  default = "value"
}
variable "subnets" {
  description = "subnet ids for alb"
  type = list(string)
  default = [ "value","value" ]
}
variable "enable_deletion_protection" {
  description = "Whether to enable deletion protection"
  type = bool
  default = false
}
variable "alb_tags" {
  description = "tags associated to alb"
  type = string
  default = "aws_alb_usw_ccoe_prd_001"
}
variable "port" {
  description = "port number allowed on alb"
  type = string
  default = "80"
}
variable "protocol" {
  description = "protocol for the allowed port"
  type = string
  default = "HTTP"
}
variable "alb_tg_name" {
  description = "target group name for alb"
  type = string
  default = "alb-tg"
}
variable "vpc_id" {
  description = "vpc id to which target group is attached"
  type = string
  default = "value"
}
variable "healthy_threshold" {
  description = "Healthy threshold value for healthcheck"
  type = number
  default = 2
}
variable "unhealthy_threshold" {
  description = "UnHealthy threshold value for healthcheck"
  type = number
  default = 2
}
variable "timeout" {
  description = "timeout for healthcheck"
  type = number
  default = 3
}
variable "resource_count" {
  description = "count for target attachment"
  type = number
  default = 2
}
variable "target_id" {
  description = "target ids for alb. in this case we will be adding ec2 instances"
  type = list(string)
  default = [ "value","value" ]
}