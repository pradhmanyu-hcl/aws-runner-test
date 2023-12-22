variable "bucket_name" {
  description = "Name of s3 bucket"
  type = string
}
variable "object_lock_enabled" {
  description = "Whether to enable the s3 object lock"
  type = bool
}
variable "force_destroy" {
  description = "Whether the bucket can forcefully destroyed"
  type = bool
}
variable "object_ownership" {
  description = "bucket ownership.Valid values are BucketOwnerPreferred, BucketOwnerEnforced"
  type = string
}
variable "bucket_acl" {
  description = "acl to apply on bucket. Valid values are private, public-read, public-read-write"
  type = string
}
variable "versioning_status" {
  description = "versioning status. Valid values are Enabled, Suspended"
  type = string
}