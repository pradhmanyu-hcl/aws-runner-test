
# Create an AWS SSO permission set 
resource "aws_ssoadmin_permission_set" "example_permission_set" {
  name        = var.permission_set_name
  description = var.permission_set_desc
  instance_arn = var.sso_instance_arn
}

## Attach Group to Permission Set
#resource "aws_ssoadmin_instance_access_control_attributes" "sso_group_permission_set_attachment" {
#  instance_arn   = var.sso_instance_arn
#  attribute {
#  key            = var.group_name
#  value    {
#    source      = [aws_ssoadmin_permission_set.example_permission_set.name]
#    }
#  }
#}


## Attach AWS SSO Managed Policy to Permission Set
#resource "aws_ssoadmin_managed_policy_attachment" "sso_managed_policy_attachment" {
#  instance_arn      = var.sso_instance_arn
#  permission_set_arn = aws_ssoadmin_permission_set.example_permission_set.arn
#  managed_policy_arn = var.managed_policy_arn  # Example policy, change as needed
#}

# Update Group access level and Permission Set
resource "aws_ssoadmin_instance_access_control_attributes" "sso_group_permission_set_update" {
  instance_arn   = var.sso_instance_arn
  attribute {
  key            = var.group_name
  value  {
      source    = [aws_ssoadmin_permission_set.example_permission_set.name]
    }
  }
}
 
## Revoke Access by Detaching Group from Permission Set
#resource "aws_ssoadmin_instance_access_control_attributes" "sso_group_permission_set_detachment" {
#  instance_arn   = var.sso_instance_arn
## access_control_attribute_name = "aws:PrincipalTag/GroupName"
#  attribute {
#  key            = var.group_name
#  value {
#      source   = [""]  # Detaching the permission set by setting an empty value
#     }
#   }
#}

## Create an AWS SSO account assignment for a group 
#resource "aws_ssoadmin_account_assignment" "example_account_assignment" {
#  instance_arn        = var.sso_instance_arn
#  target_type         = "AWS_ACCOUNT"
#  target_id           = var.account_id
#  permission_set_arn  = aws_ssoadmin_permission_set.example_permission_set.arn
#  principal_type      = "GROUP"
#  principal_id = var.group_name
#}
