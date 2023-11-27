resource "aws_ses_domain_identity" "example_domain_identity" {
  domain = var.example_domain_identity
}

resource "aws_ses_email_identity" "example_email_identity" {
  email = var.example_email_identity
}
resource "aws_ses_receipt_rule_set" "example_receipt_rule_set" {
  rule_set_name = var.example_receipt_rule_set
}

resource "aws_ses_receipt_rule" "example_receipt_rule" {
  rule_set_name = aws_ses_receipt_rule_set.example_receipt_rule_set.rule_set_name
  name          = var.receipt_rule_name
  enabled       = true
  recipients = [var.recipient_email] 
  }