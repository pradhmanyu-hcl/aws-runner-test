output "eb_app" {
  value = aws_elastic_beanstalk_application.example.name
}

output "eb_env" {
  value = aws_elastic_beanstalk_environment.example
}