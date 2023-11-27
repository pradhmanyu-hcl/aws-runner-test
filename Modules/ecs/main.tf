resource "aws_ecs_cluster" "example_cluster" {
  name = var.cluster_name
}
resource "aws_ecs_task_definition" "example_task" {
  family                   = var.aws_ecs_task_definition_family
  network_mode             = var.aws_ecs_task_definition_networkMode  # privileged' or 'user' 
  requires_compatibilities = [var.runtime_platform]
  cpu       = var.cpu
  memory    = var.memory
  execution_role_arn = aws_iam_role.ecs_execution_role.arn
  container_definitions = jsonencode([{
    name  = var.container_definitions_name
    image = var.image
    #cpu       = 256
    #memory    = 512
    essential = true
    portMappings = [{
      containerPort = var.containerPort
      hostPort      = var.hostPort
    }]
  }])
}

resource "aws_iam_role" "ecs_execution_role" {
  name = var.aws_iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

resource "aws_ecs_service" "example_service" {
  name            = var.aws_ecs_service_name
  cluster         = aws_ecs_cluster.example_cluster.id
  task_definition = aws_ecs_task_definition.example_task.arn
  launch_type     = var.runtime_platform
  network_configuration {
    subnets = [var.subnet_id] 
    security_groups = [var.security_group]
  }
}
