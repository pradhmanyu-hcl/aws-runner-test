variable "eip_tags" {
  description = "tag associated to eip"
  type = string
}
variable "subnet_id" {
  description = "Public subnet id in which nat gw is created"
  type = string
}
variable "nat_tags" {
  description = "tag associated with nat gw"
  type = string
}