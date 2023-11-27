output "kms_key_id" {
  value = aws_kms_key.test.id
}
output "kms_key_arn" {
  value = aws_kms_key.test.arn
}

output "kms_key_alias" {
  value = aws_kms_alias.test.name
}