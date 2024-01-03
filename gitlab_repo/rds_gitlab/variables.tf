variable "vpc_id" {
  description = "vpc id to create rds in"
  type = string
}
variable "sgrds_name" {
  description = "Name of rds security group"
  type = string
}
variable "sgrds_tags" {
  description = "Tag associated with rds security group"
  type = string
}
variable "sgrds_type" {
  description = "Type of traffic to be allowed on the rds security group rule 1"
  type = string
}
variable "sgrds_from_port" {
  description = "Starting port number to allow on above traffice type"
  type = string
}
variable "sgrds_to_port" {
  description = "Ending port number to allow on above traffic type"
  type = string
}
variable "sgrds_protocol" {
  description = "protocol on which the port numbers are allowed"
  type = string
}
variable "vpc_cidr" {
  description = "vpc cidr range to allow access to the security group"
  type = string
}
variable "subnet_group_name" {
  description = "The name of database subnet group"
  type = string
}
variable "subnet_group_desc" {
  description = "description of the db subnet group"
  type = string
}
variable "subnet_ids" {
  description = "list of subnet ids for the subnet group"
  type = list(string)
}
variable "parameter_group_name" {
  description = "Name of the parameter group"
  type = string
}
variable "parameter_group_desc" {
  description = "Description for paramter group"
  type = string
}
variable "family" {
  description = "pg family"
  type = string
}

variable "rds_role" {
  description = "name of iam role created for rds monitoring"
  type = string
}

variable "identifier" {
  description = "database identifier"
  type = string
}
variable "allocated_storage" {
  description = "storage allocated to db instance"
  type = number
}
variable "db_name" {
  description = "Name of the database"
  type = string
}
variable "db_instance_class" {
  description = "instance class for database"
  type = string
}
variable "engine" {
  description = "engine used in database"
  type = string
}
variable "engine_version" {
  description = "verion of db engine"
  type = string
}
variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot"
  type = bool
}
variable "storage_type" {
  description = "type of storage used for db instance"
  type = string
}
variable "storage_encrypted" {
  description = "Whether the dtorage is encrypted"
  type = bool
}
variable "multi_az" {
  description = "Whether tthe db instance is multi az"
  type = bool
}
variable "username" {
  description = "username for database"
  type = string
}
variable "password" {
  description = "the password for database"
  type = string
}
variable "db_retention_days" {
  description = "retention of db backup in days"
  type = number
}
variable "backup_window" {
  description = "backup window"
  type = string
}
variable "maintenance_window" {
  description = "backup maintenance window"
  type = string
}
variable "db_log_retention" {
  description = "retention period of cloudwatch log group"
  type = number
}
variable "performance_insights_enabled" {
  description = "Whether to enable performance insights"
  type = bool
}
variable "monitoring_interval" {
  description = "rds monitoring interval in seconds"
  type = number
}
variable "rds_tags" {
  description = "tags associated to rds instance"
  type = string
}