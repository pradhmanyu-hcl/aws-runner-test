variable "region" {
  description = "Region name in which the vpc need to be created"
  type = string
}

#vpc
variable "vpc_cidr" {
  description = "cidr block for vpc"
  type = string
}
variable "vpc_sec_cidr" {
  description = "secondary cidr range for public subnets"
  type = string
}
variable "tags" {
  description = "tag associated to vpc"
  type = string
}
variable "role_name" {
  description = "Name of iam role created for vpc flow logs"
  type = string
}
variable "loggroup_name" {
  description = "Name of cloudwatch log group where the flow logs will be stored"
  type = string
}
variable "retention_days" {
  description = "Retention period of cloudwatch log group in days"
  type = number
}
variable "flow_logs_tags" {
  description = "tag associated to vpc flow log"
  type = string
}
variable "iam_policy" {
  description = "Name of iam policy assigned to the iam role for vpc flow logs"
  type = string
}

#subnet
variable "availability_zone" {
  description = "Azs used to create subnets"
  type = list(string)
}
variable "pusnet_cidr" {
  description = "cidr range of public subnets"
  type = list(string)
}
variable "pusnet_tags" {
  description = "tags associated with public subnet"
  type = list(string)
}
variable "prsnet_cidr" {
  description = "cidr of private subnet"
  type = list(string)
}
variable "prsnet_tags" {
  description = "tags associated with Private subnets"
  type = list(string)
}
variable "dbsnet_cidr" {
  description = "cidr of the db subnet"
  type = list(string)
}
variable "dbsnet_tags" {
  description = "tags associated with database subnets"
  type = list(string)
}

#