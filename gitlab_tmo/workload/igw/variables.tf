variable "vpc_id" {
  description = "vpc id to which internet gateway to be attached"
  type = string
}
variable "igw_tags" {
  description = "tag associated to igw"
  type = string
}