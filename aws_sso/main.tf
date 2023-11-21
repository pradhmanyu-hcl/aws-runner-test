# Create an AWS SSO permission set
resource "aws_ssoadmin_permission_set" "permission_set" {
  name        = var.permission_set_name
  description = var.permission_set_desc
  instance_arn = var.sso_instance_arn
}
 
# Create an AWS SSO account assignment for a group
resource "aws_ssoadmin_account_assignment" "account_assignment" {
  instance_arn        = var.sso_instance_arn
  target_type         = "AWS_ACCOUNT"
  target_id           = var.account_id
  permission_set_arn  = aws_ssoadmin_permission_set.permission_set.arn
  principal_type      = "GROUP"
  principal_id = var.group_id
}

#Attaching Policy to permissionSets
resource "aws_ssoadmin_managed_policy_attachment" "ex-policy_attachment" {
  permission_set_name = aws_ssoadmin_permission_set.permission_set.name
  managed_policy_arn  = var.managed_policy_arn
}
