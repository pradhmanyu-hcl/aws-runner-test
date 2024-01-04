variable "vpc_id" {
  description = "vpc id to create rds praefect in"
  type = string
}
variable "sgrds_praefect_name" {
  description = "Name of rds praefect security group"
  type = string
}
variable "sgrds_praefect_tags" {
  description = "Tag associated with rds praefect security group"
  type = string
}
variable "sgrds_praefect_type" {
  description = "Type of traffic to be allowed on the rds praefect security group rule 1"
  type = string
}
variable "sgrds_praefect_from_port" {
  description = "Starting port number to allow on above traffice type for rds praefect"
  type = string
}
variable "sgrds_praefect_to_port" {
  description = "Ending port number to allow on above traffic type for praefect"
  type = string
}
variable "sgrds_praefect_protocol" {
  description = "protocol on which the port numbers are allowed for praefect"
  type = string
}
variable "vpc_cidr" {
  description = "vpc cidr range to allow access to the rds praefect security group"
  type = string
}
variable "subnet_group_name_praefect" {
  description = "The name of database subnet group for rds praefect"
  type = string
}
variable "subnet_group_desc_praefect" {
  description = "description of the db subnet group for rds praefect"
  type = string
}
variable "subnet_ids" {
  description = "list of subnet ids for the subnet group for rds praefect"
  type = list(string)
}
variable "parameter_group_name_praefect" {
  description = "Name of the parameter group for rds praefect"
  type = string
}
variable "parameter_group_desc_praefect" {
  description = "Description for paramter group for rds praefect"
  type = string
}
variable "family_praefect" {
  description = "pg family for rds praefect"
  type = string
}
variable "rdspraefect_role" {
  description = "name of iam role created for rds monitoring"
  type = string
}
variable "identifier_praefect" {
  description = "database identifier"
  type = string
}
variable "allocated_storage_praefect" {
  description = "storage allocated to db instance"
  type = number
}
variable "db_name_praefect" {
  description = "Name of the database"
  type = string
}
variable "db_instance_class_praefect" {
  description = "instance class for database"
  type = string
}
variable "engine_praefect" {
  description = "engine used in database"
  type = string
}
variable "engine_version_praefect" {
  description = "verion of db engine"
  type = string
}
variable "skip_final_snapshot_praefect" {
  description = "Whether to skip the final snapshot"
  type = bool
}
variable "storage_type_praefect" {
  description = "type of storage used for db instance"
  type = string
}
variable "storage_encrypted_praefect" {
  description = "Whether the dtorage is encrypted"
  type = bool
}
variable "multi_az_praefect" {
  description = "Whether tthe db instance is multi az"
  type = bool
}
variable "username_praefect" {
  description = "username for database"
  type = string
}
variable "password_praefect" {
  description = "the password for database"
  type = string
}
variable "db_retention_days_praefect" {
  description = "retention of db backup in days"
  type = number
}
variable "backup_window_praefect" {
  description = "backup window"
  type = string
}
variable "maintenance_window_praefect" {
  description = "backup maintenance window"
  type = string
}
variable "db_log_retention_praefect" {
  description = "retention period of cloudwatch log group"
  type = number
}
variable "performance_insights_enabled_praefect" {
  description = "Whether to enable performance insights"
  type = bool
}
variable "monitoring_interval_praefect" {
  description = "rds monitoring interval in seconds"
  type = number
}
variable "rdspraefect_tags" {
  description = "tags associated to rds instance"
  type = string
}