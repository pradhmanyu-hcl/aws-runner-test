variable "bucket_name" {
  description = "s3 bucket from which lambda will receive notifications"
  type = string
  default = "testbucket11152023"
}
variable "region" {
  description = "aws region"
  type = string
  default = "us-west-2"
}
variable "lambda_role_name" {
  description = "Name of the role for lambda function"
  type = string
  default = "adx_iam_role"
}
variable "lambda_iam_policy_name" {
  description = "policy name attached to the created role"
  type = string
  default = "adx_iam_policy"
}
variable "layer_name" {
  description = "Name of the layer for lambda function"
  type = string
  default = "python_layer"
}
variable "layer_desc" {
  description = "Description for the python layer for lambda function"
  type = string
  default = "python layer for adx"
}
variable "function_name" {
  description = "lambda function name"
  type = string
  default = "adx_lambda"
}
variable "handler_name" {
  description = "name of lambda handler"
  type = string
  default = "lambda_function"
}
variable "runtime" {
  description = "runtime for lambda"
  type = string
  default = "python3.11"
}
variable "timeout" {
  description = "timeout after which lambda function times out"
  type = string
  default = "900"
}
variable "memory_size" {
  description = "memory(in Mib) allocated to lambda function"
  type = number
  default = 256
}
# variable "vpc_id" {
#   description = "The vpc id to which lambda will be connected"
#   type = string
#   default = "vpc-003c0151b8c762bc3"
# }
# variable "prsubnet_id" {
#   description = "private subnet id in the above mentioned vpc to create lambda function in"
#   type = string
#   default = "subnet-06e8be3f0e05027ee"
# }
# variable "sg_id" {
#   description = "security group to connect to lambda function"
#   type = string
#   default = "sg-02d8638169391b601"
# }

variable "TENENT_ID" {
  type = string
  default = "687bjbjk"
}

variable "CLUSTER_INGEST_URI" {
  type = string
  default = "https://abc@example.com"
}
variable "DATABASE" {
  type = string
  default = "testdb"
}
variable "TABLE" {
  type = string
  default = "testtable"
}
variable "MAPPING" {
  type = string
  default = "sjsjhsk"
}
variable "SECRET_ID" {
  type = string
  default = "welcome537829"
}
variable "app_id" {
  type = string
  default = "0379bjhh"
}
variable "app_key" {
  type = string
  default = "1234gnchd"
}
