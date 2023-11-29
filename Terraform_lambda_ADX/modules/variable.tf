variable "lambda_function_name" {
  type        = string
  default     = "lambdafun"
}

variable "event_name" {
  type = string
  default = "eventbrg-rule"  
}

variable "iam" {
  type = string
  default = "eventbrg-iam"  
}
variable "lambda_function_handler" {
  type        = string
  default     = "hello-python.lambda_handler"
}
variable "lambda_function_runtime" {
  type        = string
  default     = "python3.11"
} 

variable "prefix" {
  type    = string
  default = "awsgov-lamb-"
}

variable "postfix" {
  type    = string
  default = "-usw-core-prd-001"
}

variable "TENENT_ID" {
  type = string
  default = "value"
}

variable "CLUSTER_INGEST_URI" {
  type = string
  default = "value"
}
variable "DATABASE" {
  type = string
  default = "value"
}
variable "TABLE" {
  type = string
  default = "value"
}
variable "MAPPING" {
  type = string
  default = "value"
}
variable "SECRET_ID" {
  type = string
  default = "value"
}
variable "app_id" {
  type = string
  default = "value"
}
variable "app_key" {
  type = string
  default = "value"
}
variable "region" {
  type = string
  default = "ap-south-1"
}

variable "source_arn" {
  type = string
  default = "arn:aws:s3:::aws-cloudtrail-logs-595787544536-62d76429"
}

variable "bucket_name" {
  type = string
  default = "aws-cloudtrail-logs-595787544536-62d76429"
}