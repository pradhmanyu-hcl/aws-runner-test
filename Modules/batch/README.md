# AWS Batch Terraform module

Terraform module which creates AWS Batch resources.

### Standard

```hcl
  Terraform Code modules:
  main.tf
  variables.tf
  output.tf
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0 |


## Resources

| Name | Type |
|------|------|
| [aws_batch_job_definition.example]
| [aws_iam_role.batch_execution_role]
| [aws_iam_policy_document.ec2_assume_role]
| [aws_iam_role.ecs_instance_role]
| [aws_iam_role_policy_attachment.ecs_instance_role]
| [aws_iam_policy_document.batch_assume_role]
| [aws_iam_role.aws_batch_service_role]
| [aws_iam_role_policy_attachment.aws_batch_service_role]
| [aws_batch_compute_environment.sample]
| [aws_batch_job_queue.test_queue]
| [aws_iam_policy_attachment.example]
| [aws_batch_scheduling_policy.example]


## Executing Terraform Commands

# Terraform Initialize
Terraform init
Observation: 1. Verify if modules got downloaded to .terraform folder terraform init

# Terraform Validate
terraform validate

# Terraform plan
terraform plan

# Terraform Apply
terraform apply -auto-approve

Observation: 
1) All the policies and iam roles should be available
2) Check on AWS batch Dashboard for getting the created resources like:
3) Job definitions, job queues, compute environment and scheduling policy
   
# Terraform Destroy
terraform destroy -auto-approve



