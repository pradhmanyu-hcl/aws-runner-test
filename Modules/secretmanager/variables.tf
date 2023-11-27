variable "secretmgn_name" {
  description = "Name of the secret manager"
  type = string
  default = "aws_secretmgn_usw_ccoe_prd_001"
}
variable "secretmgn_desc" {
  description = "Description of the scret manager"
  type = string
  default = "Secret manager for storing secrets"
}
variable "aws_secretsmanager_secret_version_secret_string" {
  description = "aws_secretsmanager_secret_version_secret_string"
  type        = string
  default     = "secret_string"
}