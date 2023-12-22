variable "availability_zone" {
  description = "Azs used to create subnets"
  type = list(string)
}
variable "vpc_id" {
  description = "vpc id in which subnet will be created"
  type = string
}
variable "pusnet_cidr" {
  description = "cidr range of public subnets"
  type = list(string)
}
variable "pusnet_tags" {
  description = "tags associated with public subnet"
  type = list(string)
}
variable "prsnet_cidr" {
  description = "cidr of private subnet"
  type = list(string)
}
variable "prsnet_tags" {
  description = "tags associated with Private subnets"
  type = list(string)
}
variable "dbsnet_cidr" {
  description = "cidr of the db subnet"
  type = list(string)
}
variable "dbsnet_tags" {
  description = "tags associated with database subnets"
  type = list(string)
}