variable "role_name" {
  description = "Name given to iam role"
  type = string
  default = "lambda-role"
}
variable "iam_policy" {
  description = "Name of the policy attached to iam role"
  type = string
  default = "lambda-policy"
}
variable "function_name" {
  description = "Name of lambda function"
  type = string
  default = "awsgov_lambda_usw_ccoe_prd_001"
}
variable "handler" {
  description = "lambda handler"
  type = string
  default = "hello-python.lamda_handler"
}
variable "runtime" {
  description = "runtime for lambda function"
  type = string
  default = "python3.10"
}
variable "vpc_id" {
  description = "The vpc id to which lambda will be connected"
  type = string
  default = ""
}
variable "prsubnet_id" {
  description = "private subnet id in the above mentioned vpc to create lambda function in"
  type = string
  default = ""
}
variable "sg_id" {
  description = "security group to connect to lambda function"
  type = string
  default = ""
}
variable "region" {
  description = "aws region to spin up lambda function"
  type = string
  default = ""
}