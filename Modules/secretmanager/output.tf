output "secret_arn" {
  value = aws_secretsmanager_secret.example_secret.arn
}
