variable "vpc_id" {
  description = "vpc id"
  type = string
}
variable "sgec2_gitlay_name" {
  description = "ec2 gitlay security group name"
  type = string
}
variable "sgec2_gitlay_ingress_from_port" {
  description = "starting port number for inbound traffic for gitlay servers"
  type = string
}
variable "sgec2_gitlay_ingress_to_port" {
  description = "ending port number for inbound traffic for gitlay servers"
  type = string
}
variable "sgec2_gitlay_ingress_protocol" {
  description = "Protocol on which allowed ports work for inbound traffic for gitlay servers"
  type = string
}
variable "sgec2_gitlay_egress_from_port" {
  description = "starting port number for outbound traffic for gitlay servers"
  type = string
}
variable "sgec2_gitlay_egress_to_port" {
  description = "ending port number for outbound traffic for gitlay servers"
  type = string
}
variable "sgec2_gitlay_egress_protocol" {
  description = "Protocol on which ports work for outbound traffic for gitlay servers"
  type = string
}
variable "vpc_cidr" {
  description = "cidr block range of vpc to allow access to gitlay security group"
  type = string
}
variable "sgec2_gitlay_tags" {
  description = "tags associated with gitlay sg"
  type = string
}
variable "ssmgitlayrole_name" {
  description = "iam role name for ec2 gitlay servers to access through system manager"
  type = string
}
variable "instance_profile_gitlay" {
  description = "instance profile name for ec2 gitlay"
  type = string
}
variable "availability_zone" {
  description = "AZs in the required region"
  type = list(string)
}
variable "gitlay_ami" {
  description = "Image id used to launch ec2 gitlay"
  type = string
}
variable "gitlay_instance_type" {
  description = "instance type to be used for ec2 gitlay"
  type = string
}
variable "subnet_id" {
  description = "subnet ids in which ec2 is launched"
  type = list(string)
}
variable "gitlay_delete_on_termination" {
  description = "Whether to delete root ebs on termination of ec2 gitlay"
  type = bool
}
variable "ec2gitlay_tags" {
  description = "tags associated with gitlay servers"
  type = list(string)
}