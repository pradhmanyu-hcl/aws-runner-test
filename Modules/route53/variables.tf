variable "domain_name" {
  description = "Domain name"
  type = string
  default = "tmobil.local"
}
variable "vpcid" {
  description = "vpc id to be attached to the hosted zone"
  type = string
  default = "value"
}
variable "record_name" {
  description = "Name of the route53 record"
  type = string
  default = "databaseprd.tmobil.local"
}
variable "db_endpoint" {
  description = "endpoints of the existing dbs"
  type = string
  default = "testdb.amazonaws.com"
}
variable "record_type" {
  description = "type of record to be created"
  type = string
  default = "CNAME"
}
variable "ttl" {
  description = "the time (in seconds) that you want the resolver too cache information for the record"
  type = string
  default = "300"
}
variable "tags" {
  description = "tag asscoiated to r53 hosted zone"
  type = string
  default = "awsgov_r53_hosted_zone_usw_ccoe_prd_001"
}