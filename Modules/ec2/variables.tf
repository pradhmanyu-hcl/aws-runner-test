variable "availability_zone" {
  description = "Azs used to create subnets"
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
variable "security_group_id" {
  description = "security group assigned to ec2"
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
