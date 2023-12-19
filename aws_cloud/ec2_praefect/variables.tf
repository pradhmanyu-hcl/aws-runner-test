variable "vpc_id" {
  description = "vpc id"
  type = string
}
variable "sgec2_praefect_name" {
  description = "ec2 praefect security group name"
  type = string
}
variable "sgec2_praefect_ingress_from_port" {
  description = "starting port number for inbound traffic for praefect servers"
  type = string
}
variable "sgec2_praefect_ingress_to_port" {
  description = "ending port number for inbound traffic for praefect servers"
  type = string
}
variable "sgec2_praefect_ingress_protocol" {
  description = "Protocol on which allowed ports work for inbound traffic for praefect servers"
  type = string
}
variable "sgec2_praefect_egress_from_port" {
  description = "starting port number for outbound traffic for praefect servers"
  type = string
}
variable "sgec2_praefect_egress_to_port" {
  description = "ending port number for outbound traffic for praefect servers"
  type = string
}
variable "sgec2_praefect_egress_protocol" {
  description = "Protocol on which ports work for outbound traffic for praefect servers"
  type = string
}
variable "vpc_cidr" {
  description = "cidr block range of vpc to allow access to praefect security group"
  type = string
}
variable "sgec2_praefect_tags" {
  description = "tags associated with praefect sg"
  type = string
}
variable "ssmpraefectrole_name" {
  description = "iam role name for ec2 praefect to access through system manager"
  type = string
}
variable "instance_profile_praefect" {
  description = "instance profile name for ec2 praefect"
  type = string
}
variable "availability_zone" {
  description = "AZs in the required region"
  type = list(string)
}
variable "praefect_ami" {
  description = "Image id used to launch ec2 praefect"
  type = string
}
variable "praefect_instance_type" {
  description = "instance type to be used for ec2 praefect"
  type = string
}
variable "subnet_id" {
  description = "subnet ids in which ec2 is launched"
  type = list(string)
}
variable "praefect_delete_on_termination" {
  description = "Whether to delete ec2 praefect root ebs on termination"
  type = bool
}
variable "ec2praefect_tags" {
description = "tags associated to ec2 praefect"
type = list(string)
}
variable "launch_conf_name_praefect" {
  description = "Name of launch configuration for rails servers"
  type = string
}
variable "autoscaling_group_name_praefect" {
  description = "Name of autoscaling group for rails servers"
  type = string
}
variable "min_size_praefect" {
  description = "Minimum size of asg"
  type = number
}
variable "max_size_praefect" {
  description = "Maximum size of asg"
  type = number
}
variable "health_check_grace_period_praefect" {
  description = "The healthcheck grace period in seconds"
  type = number
}
variable "force_delete_praefect" {
  description = "Whether to force delete the asg"
  type = bool
}
variable "health_check_type_praefect" {
  description = "the healthcheck type for autoscaling group"
  type = string
}
