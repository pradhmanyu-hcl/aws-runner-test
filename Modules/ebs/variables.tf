variable "availability_zone" {
  description = "AZ in which the volume will be created"
  type = string
  default = "value"
}
variable "volume_size" {
  description = "The size of the volume in GBs"
  type = number
  default = 5
}
variable "volume_type" {
  description = "The type of the volume to be created"
  type = string
  default = "gp2"
}
variable "tags" {
  description = "tag associated to ebs volume"
  type = string
  default = "awsgov_ebs_usw_ccoe_prd_001"
}