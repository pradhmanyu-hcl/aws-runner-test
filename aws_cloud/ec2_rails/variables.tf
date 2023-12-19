variable "vpc_id" {
  description = "vpc id"
  type = string
}
variable "sgec2_name" {
  description = "ec2 security group name"
  type = string
}
variable "sgec2_ingress_from_port" {
  description = "starting port number for inbound traffic"
  type = string
}
variable "sgec2_ingress_to_port" {
  description = "ending port number for inbound traffic"
  type = string
}
variable "sgec2_ingress_protocol" {
  description = "Protocol on which allowed ports work for inbound traffic"
  type = string
}
variable "sgec2_egress_from_port" {
  description = "starting port number for outbound traffic"
  type = string
}
variable "sgec2_egress_to_port" {
  description = "ending port number for outbound traffic"
  type = string
}
variable "sgec2_egress_protocol" {
  description = "Protocol on which ports work for outbound traffic"
  type = string
}
variable "vpc_cidr" {
  description = "cidr block range of vpc to allow access to security group"
  type = string
}
variable "sgec2_tags" {
  description = "tags associated with sg"
  type = string
}

variable "ssmrole_name" {
  description = "iam role name for ec2 to access system manager"
  type = string
}
variable "instance_profile" {
  description = "Name of instance profile"
  type = string
}
variable "availability_zone" {
  description = "AZs in the required region"
  type = list(string)
}
variable "ami" {
  description = "Image id used to launch ec2"
  type = string
}
variable "instance_type" {
  description = "instance type to be used"
  type = string
}
variable "subnet_id" {
  description = "subnet ids in which ec2 is launched"
  type = list(string)
}
variable "delete_on_termination" {
  description = "Whether to delete the root volume on deletion"
  type = bool
}
variable "ec2_tags" {
  description = "tags associated to ec2 instances"
  type = list(string)
}
variable "launch_conf_name_rails" {
  description = "Name of launch configuration for rails servers"
  type = string
}
variable "autoscaling_group_name_rails" {
  description = "Name of autoscaling group for rails servers"
  type = string
}
variable "min_size_rails" {
  description = "Minimum size of asg"
  type = number
}
variable "max_size_rails" {
  description = "Maximum size of asg"
  type = number
}
variable "health_check_grace_period_rails" {
  description = "The healthcheck grace period in seconds"
  type = number
}
variable "force_delete_rails" {
  description = "Whether to force delete the asg"
  type = bool
}
variable "health_check_type_rails" {
  description = "the healthcheck type for autoscaling group"
  type = string
}
