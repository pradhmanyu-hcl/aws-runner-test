variable "bucket_name" {
  description = "The bucket name for cdn"
  type = string
  default = "aws-cdn-bucket"
}
variable "object_lock_enabled" {
  description = "Whether to enable the object lock"
  type = bool
  default = true
}
variable "force_destroy" {
  description = "Whether to force destroy the bucket"
  type = bool
  default = true
}
variable "versioning_status" {
  description = "Status of bucket versioning"
  type = string
  default = "Enabled"
}
variable "price_class" {
  description = "Provides to lower the prices to deliver the content oustside amazon"
  type = string
  default = "PriceClass_All"
}
variable "min_ttl" {
  type = number
  default = 0
}
variable "max_ttl" {
  type = number
  default = 86400
}
variable "retain_on_delete" {
  description = "whether to retain or delete the distribution when not in use"
  type = bool
  default = false
}