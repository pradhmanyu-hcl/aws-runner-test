variable "vpc_id" {
  type = string
  default = "vpc-025e9968e335b7652"
}

variable "subnet_ids" {
  type = string
  default = "subnet-035a19ca3236cc920"
}

variable "region" {
  type = string
  default = "ap-northeast-1"
}

variable "solution_stack_name" {
  type = string
  default = "64bit Amazon Linux 2 v3.5.9 running Python 3.8"
}

variable "service_role" {
  type = string
  default = "elasticbeanstalk-service-role-tm"
}

variable "ec2_profile_role" {
  type = string
  default = "elasticbeanstalk-ec2_profile-role-tm"
}

variable "elastic_beanstalk_application" {
  type = string
  default = "tm-elasticbeenstalk-app"
}
variable "elastic_beanstalk_environment" {
  type = string
  default = "tm-elasticbeenstalk-app-env"
}

variable "security_group" {
  type = string
  default = "example-sg"
}