# Security Groups
resource "aws_security_group" "alb_rails_sg" {
  name        = "alb_rails_sg"
  description = "ALB Rails Security Group"

  ingress {
    from_port   = var.alb_rails_sg_from_port
    to_port     = var.alb_rails_sg_to_port
    protocol    = var.alb_rails_sg_protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.alb_rails_sg_from_port1
    to_port     = var.alb_rails_sg_to_port1
    protocol    = var.alb_rails_sg_protocol1
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds_git_sg" {
  name        = "rds_git_sg"
  description = "RDS GIT Security Group"

  ingress {
    from_port   = var.rds_git_sg_from_port
    to_port     = var.rds_git_sg_to_port
    protocol    = var.rds_git_sg_protocol
    cidr_blocks = [var.app_subnet_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "elastic_cache_sg" {
  name        = "elastic_cache_sg"
  description = "Elastic Cache Security Group"

  ingress {
    from_port   = var.elastic_cache_sg_from_port
    to_port     = var.elastic_cache_sg_to_port
    protocol    = var.elastic_cache_sg_protocol
    cidr_blocks = [var.app_subnet_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "nlb_sg" {
  name        = "nlb_sg"
  description = "NLB Security Group"

  ingress {
    from_port   = var.nlb_sg_from_port
    to_port     = var.nlb_sg_to_port
    protocol    = var.nlb_sg_protocol
    cidr_blocks = [var.app_subnet_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "gitlay_server_sg" {
  name        = "gitlay_server_sg"
  description = "Gitlay Server Security Group"

  ingress {
    from_port   = var.gitlay_server_sg_from_port
    to_port     = var.gitlay_server_sg_to_port
    protocol    = var.gitlay_server_sg_protocol
    cidr_blocks = aws_instance.ec2gitlay_private_ips[*] # Replace with actual CIDRs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "prefect_server_sg" {
  name        = "prefect_server_sg"
  description = "Prefect Server Security Group"

  ingress {
    from_port   = var.praefect_server_sg_from_port
    to_port     = var.praefect_server_sg_to_port
    protocol    = var.praefect_server_sg_protocol
    cidr_blocks = [var.alb_subnet_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rails_server_sg" {
  name        = "rails_server_sg"
  description = "Rails Server Security Group"

  ingress {
    from_port   = var.rails_server_sg_from_port
    to_port     = var.rails_server_sg_to_port
    protocol    = var.rails_server_sg_protocol
    cidr_blocks = [var.alb_subnet_cidr]
  }

  ingress {
    from_port   = var.rails_server_sg_from_port1
    to_port     = var.rails_server_sg_to_port1
    protocol    = var.rails_server_sg_protocol1
    cidr_blocks = [var.alb_subnet_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rds_prefect_sg" {
  name        = "rds_prefect_sg"
  description = "RDS Prefect Security Group"

  ingress {
    from_port   = var.rds_praefect_sg_from_port
    to_port     = var.rds_praefect_sg_to_port
    protocol    = var.rds_praefect_sg_protocol
    cidr_blocks = aws_instance.ec2praefect_private_ips[*]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}
