resource "aws_iam_role" "elasticbeanstalk_service_role" {
  name = var.service_role
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "elasticbeanstalk.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy-sv" {
  for_each = toset([
    "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy"])
  role       = aws_iam_role.elasticbeanstalk_service_role.name
  policy_arn = each.value
}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "elasticbeanstalk-ec2_profile-role-tm" {
  name = var.ec2_profile_role
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

resource "aws_iam_role_policy_attachment" "elasticbeanstalk-ec2_profile-role-tm" {
  role       = aws_iam_role.elasticbeanstalk-ec2_profile-role-tm.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_instance_profile" "elasticbeanstalk-ec2_profile-role-tm" {
  name = var.ec2_profile_role
  role = aws_iam_role.elasticbeanstalk-ec2_profile-role-tm.name
}

resource "aws_elastic_beanstalk_application" "example" {
  name = var.elastic_beanstalk_application
  description = "Elastic Beanstalk Application"
}

resource "aws_elastic_beanstalk_environment" "example" {
  name = var.elastic_beanstalk_environment
  application         = aws_elastic_beanstalk_application.example.name
  solution_stack_name = var.solution_stack_name

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value = aws_iam_instance_profile.elasticbeanstalk-ec2_profile-role-tm.name
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value = aws_iam_role.elasticbeanstalk_service_role.name
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id 
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = var.subnet_ids
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "public"
  }
}

resource "aws_security_group" "example" {
  name = var.security_group
  description = "Security group for Elastic Beanstalk environment"
  vpc_id =var.vpc_id
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
