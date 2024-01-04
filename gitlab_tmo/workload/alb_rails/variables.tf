variable "vpc_id" {
  description = "vpc id to connect security group to"
  type = string
}
variable "sgalb_name" {
  description = "Name of alb security group"
  type = string
}
variable "sgalb_tags" {
  description = "tag associated with alb security group"
  type = string
}
variable "sgalb_type" {
  description = "type of traffic to allow on security group rule 1"
  type = string
}
variable "sgalb_from_port" {
  description = "starting port to allow on the above traffic type"
  type = string
}
variable "sgalb_to_port" {
  description = "ending port to allow on the above traffic type"
  type = string
}
variable "sgalb_protocol" {
  description = "protocol on which the port numbers are allowed"
  type = string
}
variable "vpc_cidr" {
  description = "cidr block for vpc"
  type = string
}
variable "alb_name" {
  description = "Name of Application load balancer"
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
variable "listener_port" {
  description = "port number allowed on alb"
  type = string
}
variable "listener_protocol" {
  description = "protocol for the allowed port"
  type = string
}
variable "alb_tg_name" {
  description = "target group name for alb"
  type = string
}
variable "tg_port" {
  description = "port number for target group"
  type = string
}
variable "tg_protocol" {
  description = "protocol for above target group port"
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
variable "availability_zone" {
  description = "Azs in the required aws region"
  type = list(string)
}
variable "target_id" {
  description = "target ids for alb. in this case we will be adding ec2 instances"
  type = list(string)
}
