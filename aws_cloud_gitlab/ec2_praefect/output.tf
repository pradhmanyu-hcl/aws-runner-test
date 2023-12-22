output "ec2_praefect" {
  value = aws_instance.ec2praefect[*].id
}