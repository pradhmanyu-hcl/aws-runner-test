<<<<<<< HEAD
#Public Subnet
resource "aws_subnet" "pusnet" {
  count = length(var.availability_zone)
  
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.pusnet_cidr[count.index]
  tags = {
    Name = var.pusnet_tags[count.index]
  }
}

#Private Subnets
resource "aws_subnet" "prsnet" {
  count = length(var.availability_zone)
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.prsnet_cidr[count.index]
  tags = {
    Name = var.prsnet_tags[count.index]
  }
}

#Database Subnets
resource "aws_subnet" "dbsnet" {
  count = length(var.availability_zone)
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.dbsnet_cidr[count.index]
  tags = {
    Name = var.dbsnet_tags[count.index]
  }
=======
#Public Subnet
resource "aws_subnet" "pusnet" {
  count = length(var.availability_zone)
  
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.pusnet_cidr[count.index]
  tags = {
    Name = var.pusnet_tags[count.index]
  }
}

#Private Subnets
resource "aws_subnet" "prsnet" {
  count = length(var.availability_zone)
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.prsnet_cidr[count.index]
  tags = {
    Name = var.prsnet_tags[count.index]
  }
}

#Database Subnets
resource "aws_subnet" "dbsnet" {
  count = length(var.availability_zone)
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.dbsnet_cidr[count.index]
  tags = {
    Name = var.dbsnet_tags[count.index]
  }
>>>>>>> 374f69e284680e4c00db5732080818999ea80ab9
}