variable "key_usage" {
  description = "The usage of the created key"
  type = string
  default = "ENCRYPT_DECRYPT"
}
variable "multi_region" {
  description = "Whether the key is a multi-region or regional key"
  type = bool
  default = false
}
variable "spec" {
  description = "CMK spec"
  type = string
  default = "SYMMETRIC_DEFAULT"
}
variable "key_rotation" {
  description = "Whether to rotate keys"
  type = bool
  default = true
}
variable "deletion_window" {
  description = "Number of days in which the key will delete"
  type = number
  default = 10
}
variable "alias" {
  description = "Alias given to key"
  type = string
  default = "ec2-alias"
}
variable "tags" {
  description = "tags associated with CMK"
  type = string
  default = "awsgov_kms_usw_ccoe_prd_001"
}