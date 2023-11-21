variable "permission_set_name" {
  description = "name given to the permission set"
  type = string
  default = "Sec-PermissionSet"
}
variable "permission_set_desc" {
  description = "Description given for the permission set created"
  type = string
  default = "Sec permission set for AWS SSO"
}
variable "sso_instance_arn" {
  description = "instance arn for permission set"
  type = string
  default = "arn:aws:sso:::instance/ssoins-79078a57946c4411"
}
variable "group_id" {
  description = "group id for sso login. Currently using for group (AWS-S3-RO)"
  type = string
  default = "d8f10300-3051-70a3-850e-7bccf7e97f17"
}
variable "account_id" {
  description = "account id used for sso login"
  type = string
  default = "595787544536"
}
variable "region" {
  description = "aws region"
  type = string
  default = "us-west-2"
}
