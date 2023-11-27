resource "aws_batch_job_definition" "example" {
  name = var.batch_job_definition
  type = "container"
  container_properties = jsonencode({
    command = ["ls", "-la"],
    image    = var.container_image
    #jobRoleArn = aws_iam_role.batch_execution_role.arn
    executionRoleArn = aws_iam_role.batch_execution_role.arn
    resourceRequirements = [
      {
        type  = "VCPU"
        value = "8"
      },
      {
        type  = "MEMORY"
        value = "6144"
      }
    ]
  })
}

resource "aws_iam_role" "batch_execution_role" {
  name = var.batch_execution_role
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "batch.amazonaws.com"
        }
      }
    ]
  })
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

resource "aws_iam_role" "ecs_instance_role" {
  name               = var.ecs_instance_role
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role" {
  role       = aws_iam_role.ecs_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs_instance_role" {
  name = var.iam_instance_profile
  role = aws_iam_role.ecs_instance_role.name
}

data "aws_iam_policy_document" "batch_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["batch.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "aws_batch_service_role" {
  name               = var.aws_batch_service_role
  assume_role_policy = data.aws_iam_policy_document.batch_assume_role.json
}

resource "aws_iam_role_policy_attachment" "aws_batch_service_role" {
  role       = aws_iam_role.aws_batch_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}

resource "aws_batch_compute_environment" "sample" {
  compute_environment_name = var.batch_compute_environment

  compute_resources {
    instance_role = aws_iam_instance_profile.ecs_instance_role.arn
    instance_type = var.compute_instance_type
    max_vcpus = 8
    min_vcpus = 0

    security_group_ids = var.security_group_ids
    subnets = var.subnets
    type = "EC2"
  }

  service_role = aws_iam_role.aws_batch_service_role.arn
  type         = "MANAGED"
  depends_on   = [aws_iam_role_policy_attachment.aws_batch_service_role]
}

resource "aws_batch_job_queue" "test_queue" {
  name     = var.batch_job_queue
  state    = "ENABLED"
  priority = 1
  compute_environments = [
    aws_batch_compute_environment.sample.arn    
  ]
}
resource "aws_iam_policy_attachment" "example" {
  name = var.iam_policy_attachment
  roles = [aws_iam_role.batch_execution_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_batch_scheduling_policy" "example" {
  name = var.batch_scheduling_policy
  fair_share_policy {
    compute_reservation = 1
    share_decay_seconds = 3600

    share_distribution {
      share_identifier = "A1*"
      weight_factor    = 0.1
    }

    share_distribution {
      share_identifier = "A2"
      weight_factor    = 0.2
    }
  } 
}
