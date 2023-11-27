# AWS elasticbeenstalk Terraform module
Terraform module which creates AWS Elasticbeenstalk resources.

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

## Providers
| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Resources
| Name | Type |
|------|------|
| [aws_iam_role.elasticbeanstalk_service_role-tm]
| [aws_iam_role_policy_attachment.attach_policy-sv]
| [aws_iam_role.elasticbeanstalk-ec2_profile-role-tm]
| [aws_iam_role_policy_attachment.elasticbeanstalk-ec2_profile-role-tm]
| [aws_elastic_beanstalk_application.example]
| [aws_elastic_beanstalk_environment.example]
| [aws_security_group.example]


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
1) first above two roles and some polices will be created in IAM's role and policy
2) One application and environment will be creatd in aws elasticbeen resource
3) Also domain will attached with application
   
# Terraform Destroy
terraform destroy -auto-approve