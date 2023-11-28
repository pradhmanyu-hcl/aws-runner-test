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
variable "group_name" {
  description = "group id for sso login."
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
variable "managed_policy_arn" {
  description = "ARN of the AWS managed policy to attach"
  type = string
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}

#ARN for admin access= "arn:aws:iam::aws:policy/AdministratorAccess"
#ARN for read only access= "arn:aws:iam::aws:policy/ReadOnlyAccess"
#ARN for developer access= "arn:aws:iam::aws:policy/AWSProtonDeveloperAccess"
#ARN for network admin access= "arn:aws:iam::aws:policy/job-function/NetworkAdministrator"
