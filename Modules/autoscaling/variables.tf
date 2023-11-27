variable "launch_conf_name" {
  description = "Name of launch configuration"
  type = string
  default = "aws-aslc"
}
variable "ami" {
  description = "Image id used to launch ec2"
  type = string
  default = "ami-03f65b8614a860c29"
}
variable "instance_type" {
  description = "instance type to be used"
  type = string
  default = "t2.micro"
}
variable "autoscaling_group_name" {
  description = "Name of autoscaling group"
  type = string
  default = "aws-asg-usw-ccoe-prd-001"
}
variable "subnet_id" {
  description = "subnet ids in which the asg to be launch"
  type = list(string)
  default = [ "" ]
}
variable "security_group" {
  description = "security group id for launch configuration"
  type = string
  default = ""
}
variable "min_size" {
  description = "Minimum size of asg"
  type = number
  default = 2
}
variable "max_size" {
  description = "Maximum size of asg"
  type = number
  default = 3
}
variable "health_check_grace_period" {
  description = "The healthcheck grace period in seconds"
  type = number
  default = 300
}
variable "force_delete" {
  description = "Whether to force delete the asg"
  type = bool
  default = true
}
variable "health_check_type" {
  description = "the healthcheck type for autoscaling group"
  type = string
  default = "EC2"
}