<<<<<<< HEAD
variable "vpc_id" {
  description = "vpc id to which internet gateway to be attached"
  type = string
}
variable "igw_id" {
  description = "internet gateway route for route table"
  type = string
}

variable "nat_gateway_id" {
  description = "nat gateway route for private route table"
  type = string
}

variable "public_subnet_id" {
  description = "need to attach public route table to public subnet"
  type = string
}

variable "private_subnet_id" {
  description = "need to attach private route table to private subnet"
  type = string
=======
variable "vpc_id" {
  description = "vpc id to which internet gateway to be attached"
  type = string
}
variable "igw_id" {
  description = "internet gateway route for route table"
  type = string
}

variable "nat_gateway_id" {
  description = "nat gateway route for private route table"
  type = string
}

variable "public_subnet_id" {
  description = "need to attach public route table to public subnet"
  type = string
}

variable "private_subnet_id" {
  description = "need to attach private route table to private subnet"
  type = string
>>>>>>> 374f69e284680e4c00db5732080818999ea80ab9
}