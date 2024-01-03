<<<<<<< HEAD
variable "vpc_id" {
  description = "vpc id to create elasticache in"
  type = string
}
variable "sgelc_name" {
  description = "Name of elasticache security group"
  type = string
}
variable "sgelc_ingress_from_port" {
  description = "starting port number to allow inbound traffic"
  type = string
}
variable "sgelc_ingress_to_port" {
  description = "ending port number to allow inbound traffic"
  type = string
}
variable "sgelc_ingress_protocol" {
  description = "protocol for above inbound traffic port numbers"
  type = string
}
variable "sgelc_egress_from_port" {
  description = "starting port number to allow outbound traffic"
  type = string
}
variable "sgelc_egress_to_port" {
  description = "ending port number to allow outbound traffic"
  type = string
}
variable "sgelc_egress_protocol" {
  description = "protocol for above outbound ports"
  type = string
}
variable "vpc_cidr" {
  description = "vpc cidr range to allow access to the security group"
  type = string
}
variable "cache_subnet_group_name" {
  description = "Name of elastic cache subnet group"
  type = string
}
variable "subnet_ids" {
  description = "List of subnet ids that will be a part of elastic cache subnet group"
  type = list(string)
}
variable "replication_group_id" {
  description = "name of replication group for redis"
  type = string
}
variable "rep_description" {
  description = "Description for the repl group created"
  type = string
}
variable "automatic_failover_enabled" {
  description = "Whether to enable automatic failover"
  type = bool
}
variable "at_rest_encryption_enabled" {
  description = "Whether to enable encrytion at rest"
  type = bool
}
variable "transit_encryption_enabled" {
  description = "Whether to enable encryption in transit"
  type = bool
}
variable "multi_az_enabled" {
  description = "Whether to enable multi az configuration"
  type = bool
}
variable "cache_engine" {
  description = "the name of engine used for the elasticcache cluster"
  type = string
}
variable "cache_port" {
  description = "required port for the instance"
  type = number
}
variable "node_type" {
  description = "cache node type used"
  type = string
}
variable "num_cache_nodes" {
  description = "Number of cache nodes"
  type = number
}
variable "parameter_group" {
  description = "Name of parameter group to be used"
  type = string
}
variable "snapshot_retention_limit" {
  description = "retention of snapshot in days"
  type = number
}
variable "snapshot_window" {
  description = "snapshot window for redis cache"
  type = string
}
=======
variable "vpc_id" {
  description = "vpc id to create elasticache in"
  type = string
}
variable "sgelc_name" {
  description = "Name of elasticache security group"
  type = string
}
variable "sgelc_ingress_from_port" {
  description = "starting port number to allow inbound traffic"
  type = string
}
variable "sgelc_ingress_to_port" {
  description = "ending port number to allow inbound traffic"
  type = string
}
variable "sgelc_ingress_protocol" {
  description = "protocol for above inbound traffic port numbers"
  type = string
}
variable "sgelc_egress_from_port" {
  description = "starting port number to allow outbound traffic"
  type = string
}
variable "sgelc_egress_to_port" {
  description = "ending port number to allow outbound traffic"
  type = string
}
variable "sgelc_egress_protocol" {
  description = "protocol for above outbound ports"
  type = string
}
variable "vpc_cidr" {
  description = "vpc cidr range to allow access to the security group"
  type = string
}
variable "cache_subnet_group_name" {
  description = "Name of elastic cache subnet group"
  type = string
}
variable "subnet_ids" {
  description = "List of subnet ids that will be a part of elastic cache subnet group"
  type = list(string)
}
variable "replication_group_id" {
  description = "name of replication group for redis"
  type = string
}
variable "rep_description" {
  description = "Description for the repl group created"
  type = string
}
variable "automatic_failover_enabled" {
  description = "Whether to enable automatic failover"
  type = bool
}
variable "at_rest_encryption_enabled" {
  description = "Whether to enable encrytion at rest"
  type = bool
}
variable "transit_encryption_enabled" {
  description = "Whether to enable encryption in transit"
  type = bool
}
variable "multi_az_enabled" {
  description = "Whether to enable multi az configuration"
  type = bool
}
variable "cache_engine" {
  description = "the name of engine used for the elasticcache cluster"
  type = string
}
variable "cache_port" {
  description = "required port for the instance"
  type = number
}
variable "node_type" {
  description = "cache node type used"
  type = string
}
variable "num_cache_nodes" {
  description = "Number of cache nodes"
  type = number
}
variable "parameter_group" {
  description = "Name of parameter group to be used"
  type = string
}
variable "snapshot_retention_limit" {
  description = "retention of snapshot in days"
  type = number
}
variable "snapshot_window" {
  description = "snapshot window for redis cache"
  type = string
}
>>>>>>> 374f69e284680e4c00db5732080818999ea80ab9
