variable "efs_name" {
  description = "Name of the file system"
  type = string
  default = "myefs"
}
variable "performance_mode" {
  description = "File system performance mode. Can be genralPurpose or maxIO"
  type = string
  default = "generalPurpose"
}
variable "throughput_mode" {
  description = "Throughput mode of file system. can be any of 'bursting', 'elastic' and 'provisioned'when using provisoned, set provisioned_throughput_in_mibps"
  type = string
  default = "bursting"
}
variable "encrypted" {
  description = "Whether the efs is encrypted"
  type = bool
  default = true
}
variable "tags" {
  description = "tag associated to efs"
  type = string
  default = "awsgov_efs_usw_ccoe_prd_001"
}
