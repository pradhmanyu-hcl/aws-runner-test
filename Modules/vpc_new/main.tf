#VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.tags
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "vpc_sec_cidr" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.vpc_sec_cidr
}

#IAM role for vpc flow logs
resource "aws_iam_role" "rolefl" {
  name = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

#cloudwatch log group
resource "aws_cloudwatch_log_group" "clg" {
  name = var.loggroup_name
  retention_in_days = var.retention_days
  lifecycle {
    prevent_destroy = false
  }
}

#VPC flow logs
resource "aws_flow_log" "vpcfl" {
  iam_role_arn = aws_iam_role.rolefl.arn
  log_destination = aws_cloudwatch_log_group.clg.arn
  traffic_type = "ALL"
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.flow_logs_tags
  }
}

#policy addition to iam role
resource "aws_iam_role_policy" "policyfl" {
  name = var.iam_policy
  role = aws_iam_role.rolefl.id
  policy = data.aws_iam_policy_document.policydoc.json
}