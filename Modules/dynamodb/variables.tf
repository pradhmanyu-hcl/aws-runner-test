variable "basic-dynamodb-table" {
    description = "name of db"
    type = string
    default = "dynamodb"
}
variable "billing_mode" {
  description = "billing mode to be used. Valid options are PROVISIONED & PAY PER REQUEST"
  type = string
  default = "PROVISIONED"
}
variable "read_capacity" {
  description = "The number of read units for the table"
  type = number
  default = 10
}
variable "write_capacity" {
  description = "The number of write units for the table"
  type = number
  default = 10
}
variable "hash_key" {
  description = "The attribute used for hash(partition) key"
  type = string
  default = "UserId"
}
variable "range_key" {
  description = "The attribute used for range(sort) key"
  type = string
  default = "Name"
}
variable "ttl_attribute_name" {
  description = "Attribute name to store the timestamp in"
  type = string
  default = "TimeToExist"
}
variable "ttl_enabled" {
  description = "Whether to enable the ttl"
  type = bool
  default = false
}
variable "gsi_name" {
  description = "The name of global secondary index"
  type = string
  default = "UserTitleIndex"
}
variable "tags" {
  description = "tags associated to the dynamodb"
  type = string
  default = "awsgov_dynamodb_usw_ccoe_prd_001"
}