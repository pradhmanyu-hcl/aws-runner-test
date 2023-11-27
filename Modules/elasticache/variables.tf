variable "subnet_group" {
  description = "Name of elastic cache subnet group"
  type = string
  default = "elastic-cache-subnet-group"
}
variable "subnet_ids" {
  description = "List of subnet ids that will be a part of elastic cache subnet group"
  type = list(string)
  default = ["subnet-09238142413edfc93","subnet-07978c6df18f5d454"]
}
variable "replication_group_id" {
  description = "name of replication group for redis"
  type = string
  default = "rep-group-redis"
}
variable "rep_description" {
  description = "Description for the repl group created"
  type = string
  default = "replication group for redis cluster"
}
variable "engine" {
  description = "the name of engine used for the elasticcache cluster"
  type = string
  default = "redis"
}
variable "port" {
  description = "required port for the instance"
  type = number
  default = 6379
}
variable "node_type" {
  description = "cache node type used"
  type = string
  default = "cache.m4.large"
}
variable "num_cache_nodes" {
  description = "Number of cache nodes"
  type = number
  default = 2
}
variable "parameter_group" {
  description = "Name of parameter group to be used"
  type = string
  default = "default.redis7"
}
