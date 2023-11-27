variable "example_receipt_rule_set" {
  description = "Rule set name"
  type        = string
  default     = "receipt-rule-set"
}
variable "receipt_rule_name" {
  description = "Name of the ses receipt rule"
  type = string
  default = "awsgov_ses_rule_usw_ccoe_prd_001"
}
variable "example_domain_identity" {
  type        = string
  default     = "example.com"
}

variable "example_email_identity" {
  type        = string
  default     = "uday@example.com"
}
variable "recipient_email" {
  description = "Email address of recipient"
  type = string
  default = "bhanu@example.com"
}