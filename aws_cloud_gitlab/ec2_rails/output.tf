output "ec2" {
  value = aws_instance.awsec2l[*].id
}