variable "region" {
  default = "ap-northeast-1"
}
variable "batch_job_definition" {
  type = string
  default = "pacman-rule-engine-batch-job-10"
}

variable "container_image" {
    type = string
    default = "326319537952.dkr.ecr.ap-south-1.amazonaws.com/my-ecr"
}

variable "batch_execution_role" {
    type = string
    default = "awsgov-batch-iamrole-usw-core-prd-001-"  
}

variable "ecs_instance_role" {
    type = string
    default = "ecs_instance_role-"
}
variable "aws_batch_service_role" {
    type = string
    default = "aws_batch_service_role-"  
}
variable "batch_compute_environment" {
    type = string
    default = "compute-environment" 
}
variable "compute_instance_type" {
    type = list(string)
    default = ["c4.large"] 
}
variable "security_group_ids" {
    type = list(string)
    default = [ "sg-0cafbb64607f7cf52" ]  
}

variable "subnets" {
    type = list(string)
    default = [ "subnet-035a19ca3236cc920" ]  
}
variable "batch_job_queue" {
    type = string
    default = "pacman-batch-job-1"  
}
variable "iam_policy_attachment" {
    type = string
    default = "tm-ecr-policy-attachment" 
}
variable "batch_scheduling_policy" {
    type = string
    default = "default-scheduling" 
}
variable "iam_instance_profile" {
    type = string
    default = "ecs_instance_profile"  
}
