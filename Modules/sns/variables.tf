variable "sns_topic_name" {
  description = "Name of sns topic"
  type = string
  default = "awsgov_sns_usw_ccoe_prd_001"
}
variable "account_id" {
  description = "aws account id which will own sns topic"
  type = number
  default = 326319537952
}
variable "display_name" {
  description = "display name of sns topic"
  type = string
  default = "Example sns topic"
}
variable "protocol" {
  description = "protocol by which the notification is sent"
  type = string
  default = "email"
}
variable "endpoint" {
  description = "endpoint of the protocol being used"
  type = string
  default = "example@gmail.com"
}