resource "aws_secretsmanager_secret" "example_secret" {
  name = var.secretmgn_name
  description = var.secretmgn_desc
}

resource "aws_secretsmanager_secret_version" "example_secret_version" {
  secret_id     = aws_secretsmanager_secret.example_secret.id
  secret_string = var.aws_secretsmanager_secret_version_secret_string 
  
    # Specify the retention period in days (e.g., default 30 days)
  #version_stages = ["AWSCURRENT"]
  #version_id     = "AWSCURRENT"   
}