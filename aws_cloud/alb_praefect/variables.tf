variable "vpc_id" {
  description = "vpc id to connect security group to"
  type = string
}
variable "sgalb_praefect_name" {
  description = "security group name for praefect alb"
  type = string
}
variable "sgalb_praefect_tags" {
  description = "tags associated with praefect alb security group"
  type = string
}
variable "sgalb_praefect_type" {
  description = "Type of traffic allowed on praefect alb security group"
  type = string
}
variable "sgalb_praefect_from_port" {
  description = "starting port number to allow on the above traffic type"
  type = string
}
variable "sgalb_praefect_to_port" {
  description = "ending port number to allow on the above traffic type"
  type = string
}
variable "sgalb_praefect_protocol" {
  description = "protocol on which the port numbers are allowed"
  type = string
}
variable "vpc_cidr" {
  description = "cidr block for vpc to allow traffic on security group"
  type = string
}
variable "alb_praefect_name" {
  description = "Name of Praefect application load balancer"
  type = string
}
variable "subnets" {
  description = "subnet ids for alb"
  type = list(string)
}
variable "praefect_enable_deletion_protection" {
  description = "Whether to enable the deletion protection in praefect alb"
  type = string
}
variable "alb_praefect_tags" {
  description = "tags associated with praefect alb"
  type = string
}
variable "listener_praefect_port" {
  description = "listener port for praefect alb"
  type = string
}
variable "listener_praefect_protocol" {
  description = "listener protocol for prafect alb"
  type = string
}
variable "alb_tg_prafect_name" {
  description = "target group name for praefect alb"
  type = string
}
variable "tg_praefect_port" {
  description = "target group port number for praefect alb"
  type = string
}
variable "tg_praefect_protocol" {
  description = "target group protocol for praefect alb"
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
  description = "target ids for alb. in this case we will be adding ec2 instances"
  type = list(string)
}