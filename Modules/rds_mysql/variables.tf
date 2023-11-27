variable "subnet_group_name" {
  description = "The name of database subnet group"
  type = string
  default = "rds-subnetgrp"
}
variable "subnet_group_desc" {
  description = "description of the db subnet group"
  type = string
  default = "RDS Mysql Subnet Group"
}
variable "subnet_ids" {
  description = "list of subnet ids for the subnet group"
  type = list(string)
  default = [ "subnet-09238142413edfc93","subnet-0602f0e7b10a45029" ]
}
variable "parameter_group_name" {
  description = "Name of the parameter group"
  type = string
  default = "rds-pg"
}
variable "parameter_group_desc" {
  description = "Description for paramter group"
  type = string
  default = "Mysql parameter Group"
}
variable "family" {
  description = "pg family"
  type = string
  default = "mysql5.7"
}
variable "allocated_storage" {
  description = "storage allocated to db instance"
  type = number
  default = 10
}
variable "identifier" {
  description = "database identifier"
  type = string
  default = "awsgov-rdsmysql-usw-ccoe-prd-001"
}
variable "db_name" {
  description = "Name of the database"
  type = string
  default = "mydb"
}
variable "engine" {
  description = "engine used in database"
  type = string
  default = "mysql"
}
variable "sgdatabase_id" {
  description = "Security group assigned to rds instance"
  type = string
  default = "sg-02d8638169391b601"
}
variable "engine_version" {
  description = "verion of db engine"
  type = string
  default = "5.7"
}
variable "db_instance_class" {
  description = "instance class for database"
  type = string
  default = "db.t3.micro"
}
variable "username" {
  description = "username for database"
  type = string
  default = "admin"
}
variable "password" {
  description = "the password for database"
  type = string
  default = "mysql9916"
}
variable "storage_type" {
  description = "type of storage used for db instance"
  type = string
  default = "gp2"
}
variable "storage_encrypted" {
  description = "Whether the dtorage is encrypted"
  type = bool
  default = false
}
variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot"
  type = bool
  default = true
}
variable "multi_az" {
  description = "Whether tthe db instance is multi az"
  type = bool
  default = true
}
variable "rds_tags" {
  description = "tags associated to rds instance"
  type = string
  default = "Production Database"
}

