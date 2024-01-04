variable "availability_zone" {
  description = "Azs in the aws region"
  type = list(string)
}
variable "eip_tags" {
  description = "tag associated to eip"
  type = list(string)
}
variable "subnet_id" {
  description = "Public subnet id in which nat gw is created"
  type = list(string)
}
variable "nat_tags" {
  description = "tag associated with nat gw"
  type = list(string)
}

variable "vpc_id" {
  description = "vpc id"
  type = string
}