variable "alb_name" {
  description = "Name of Application load balancer"
  type = string
}
variable "security_group_id" {
  description = "security group assigned to alb"
  type = string
}
variable "subnets" {
  description = "subnet ids for alb"
  type = list(string)
}
variable "enable_deletion_protection" {
  description = "Whether to enable deletion protection"
  type = bool
}
variable "alb_tags" {
  description = "tags associated to alb"
  type = string
}
variable "port" {
  description = "port number allowed on alb"
  type = string
}
variable "protocol" {
  description = "protocol for the allowed port"
  type = string
}
variable "alb_tg_name" {
  description = "target group name for alb"
  type = string
}
variable "vpc_id" {
  description = "vpc id to which target group is attached"
  type = string
}
variable "healthy_threshold" {
  description = "Healthy threshold value for healthcheck"
  type = number
}
variable "unhealthy_threshold" {
  description = "UnHealthy threshold value for healthcheck"
  type = number
}
variable "timeout" {
  description = "timeout for healthcheck"
  type = number
}
variable "resource_count" {
  description = "count for target attachment"
  type = number
}
variable "target_id" {
  description = "target ids for alb. in this case we will be adding ec2 instances"
  type = list(string)
}