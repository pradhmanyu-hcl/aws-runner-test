variable "cluster_name" {
  description = "Name of ecs cluster"
  type = string
  default = "sample-ecs-cluster"
}
variable "aws_ecs_task_definition_family" {
  type        = string
  description = "A friendly name of the cluster task family."
  default     = "ecs-task"
}
variable "aws_ecs_task_definition_networkMode" {
  type        = string
  description = "A friendly name of the cluster task network mode."
  default     = "awsvpc"
}
variable "runtime_platform" {
  description = "operating system family for ecs"
  type = string
  default = "FARGATE"
}
variable "cpu" {
  description = "number of cpu units used by the task"
  type = number
  default = 256
}
variable "memory" {
  description = "amount of memory(in Mib) used by ecs task"
  type = number
  default = 512
}
variable "container_definitions_name" {
  type        = string
  description = "A friendly name of the container."
  default     = "ecs-container"
}
variable "image" {
  description = "image used by the container"
  type = string
  default = "nginx:latest"
}
variable "containerPort" {
  description = "port number of the container"
  type = number
  default = 80
}
variable "hostPort" {
  description = "port of of host for ecs cluster"
  type = number
  default = 80
}
variable "aws_iam_role_name" {
  type        = string
  description = "name of iam role"
  default     = "ecs_execution_role"
}
variable "aws_ecs_service_name" {
  type        = string
  description = "Service name."
  default     = "ecs-service"
}
variable "subnet_id" {
  description = "subnet id to create ecs in"
  type = string
  default = "subnet-06df126190ab14a26"
}
variable "security_group" {
  description = "security group id to be assigned for ecs service"
  type = string
  default = "sg-0a85eb9b9703176e2"
}