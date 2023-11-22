variable "vpc_id" {
  description = "vpc id in which security group is created"
  type = string
  default = "value"
}
variable "sg_name" {
  description = "Name given to security group"
  type = string
  default = "web-security-group"
}
variable "from_port" {
  description = "List of starting port numbers for inbound traffic"
  type = string
  default = "22"
}
variable "to_port" {
  description = "List of ending port numbers for inbound traffic"
  type = string
  default = "22"
}
variable "vpc_cidr" {
  description = "vpc cidr range to allow traffic on security group"
  type = string
  default = "10.0.0.0/16"
}
variable "sg_tags" {
  description = "tags associated with sg"
  type = string
  default = "awsgov_sg_usw_ccoe_prd_001"
}