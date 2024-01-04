#VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_tags
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "vpc_sec" {
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

#Subnets

#Public Subnet
resource "aws_subnet" "pusnet" {
  count = length(var.availability_zone)
  
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.pusnet_cidr[count.index]
  tags = {
    Name = var.pusnet_tags[count.index]
  }
}

#Private Subnets
resource "aws_subnet" "prsnet" {
  count = length(var.availability_zone)
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.prsnet_cidr[count.index]
  tags = {
    Name = var.prsnet_tags[count.index]
  }
}

#Database Subnets
resource "aws_subnet" "dbsnet" {
  count = length(var.availability_zone)
  vpc_id = aws_vpc.vpc.id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.dbsnet_cidr[count.index]
  tags = {
    Name = var.dbsnet_tags[count.index]
  }
}

#Resource access manager
resource "aws_ram_resource_share" "share" {
  name                      = "mysharedvpc"
  allow_external_principals = false  # true for accounts outside organization
}

resource "aws_ram_principal_association" "principal" {
  principal          = "123456789012"  # destination account
  resource_share_arn = aws_ram_resource_share.share.arn
}

resource "aws_ram_resource_association" "pusubnet" {
  resource_arn       = [aws_subnet.pusnet.arn]  # source account
  resource_share_arn = aws_ram_resource_share.share.arn
}
resource "aws_ram_resource_association" "prsubnet" {
  resource_arn = [aws_subnet.prsnet.arn]
  resource_share_arn = aws_ram_resource_share.share.arn
}