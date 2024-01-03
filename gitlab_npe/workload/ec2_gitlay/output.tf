output "ec2_gitlay" {
  value = aws_instance.ec2gitlay[*].id
}