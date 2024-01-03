<<<<<<< HEAD
#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.igw_tags
  }
=======
#Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.igw_tags
  }
>>>>>>> 374f69e284680e4c00db5732080818999ea80ab9
}