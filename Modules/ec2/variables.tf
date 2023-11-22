variable "availability_zone" {
  description = "Azs used to create subnets"
  type = list(string)
  default = [ "us-west-2a","us-west-2b" ]
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
variable "security_group_id" {
  description = "security group assigned to ec2"
  type = string
  default = ""
}
variable "subnet_id" {
  description = "subnet ids in which ec2 is launched"
  type = list(string)
  default = ["",""]
}
variable "delete_on_termination" {
  description = "Whether to delete the root volume on deletion"
  type = bool
  default = false
}
variable "ec2_tags" {
  description = "tags associated to ec2 instances"
  type = list(string)
  default = ["awsec2l1","awsec2l2"]
}
