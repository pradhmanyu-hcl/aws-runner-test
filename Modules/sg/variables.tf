variable "vpc_id" {
  description = "vpc id in which security group is created"
  type = string
}
variable "sg_name" {
  description = "Name given to security group"
  type = string
}
variable "ingress_from_port" {
  description = "starting port number for inbound traffic"
  type = string
}
variable "ingress_to_port" {
  description = "ending port number for inbound traffic"
  type = string
}
variable "ingress_protocol" {
  description = "Protocol on which allowed ports work for inbound traffic"
  type = string
}
variable "egress_from_port" {
  description = "starting port number for outbound traffic"
  type = string
}
variable "egress_to_port" {
  description = "ending port number for outbound traffic"
  type = string
}
variable "egress_protocol" {
  description = "Protocol on which ports work for outbound traffic"
  type = string
}
variable "vpc_cidr" {
  description = "cidr block range of vpc to allow access to security group"
  type = string
}
variable "sg_tags" {
  description = "tags associated with sg"
  type = string
}