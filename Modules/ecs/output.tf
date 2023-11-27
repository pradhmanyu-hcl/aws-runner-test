output "aws_ecs_cluster" {
  value = aws_ecs_cluster.example_cluster.name
}

output "aws_ecs_task_definition" {
  value = aws_ecs_task_definition.example_task.family
}