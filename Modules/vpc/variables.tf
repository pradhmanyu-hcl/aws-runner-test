variable "vpc_cidr" {
  description = "cidr block for vpc"
  type = string
  default = "10.0.0.0/16"
}
variable "vpc_sec_cidr" {
  description = "secondary cidr range for public subnets"
  type = string
  default = "172.0.0.0/16"
}
variable "tags" {
  description = "tag associated to vpc"
  type = string
  default = "awsgov_vpc_usw_ccoe_prd_001"
}
variable "role_name" {
  description = "Name of iam role created for vpc flow logs"
  type = string
  default = "vpcfl"
}
variable "loggroup_name" {
  description = "Name of cloudwatch log group where the flow logs will be stored"
  type = string
  default = "vpcflowloggroup"
}
variable "retention_days" {
  description = "Retention period of cloudwatch log group in days"
  type = number
  default = 365
}
variable "flow_logs_tags" {
  description = "tag associated to vpc flow log"
  type = string
  default = "awsgov_vpcfl_usw_ccoe_prd_001"
}
variable "iam_policy" {
  description = "Name of iam policy assigned to the iam role for vpc flow logs"
  type = string
  default = "vpcflpolicy"
}
