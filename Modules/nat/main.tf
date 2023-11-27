#NAT Gateway
resource "aws_eip" "eip" {
  domain = "vpc"
  tags = {
    Name = var.eip_tags
  }
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.eip.id
  subnet_id = var.subnet_id
  tags = {
    Name = var.nat_tags
  }
}