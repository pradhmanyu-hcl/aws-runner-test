variable "vpc_id" {
  description = "vpc id in which subnet will be created"
  type = string
}
variable "purt_tags" {
  description = "tags associated to Public route table"
  type = string
}
variable "prrt_tags" {
  description = "tags associated to Private route table"
  type = string
}
variable "dbrt_tags" {
  description = "tags associated to database route table"
  type = string
}
variable "igw" {
  description = "igw id for access to internet for public subnets"
  type = string
}
variable "natgw" {
  description = "nat gw id for private subnets"
  type = string
}
variable "resource_count" {
  description = "Resource count taken for route table associations"
  type = number
}
variable "pusnet_id" {
  description = "public subnet ids to be attached to public rt"
  type = list(string)
}
variable "prsnet_id" {
  description = "private subnet ids to be attached to private rt"
  type = list(string)
}
variable "dbsnet_id" {
  description = "database subnet ids to be attached to database rt"
  type = list(string)
}


