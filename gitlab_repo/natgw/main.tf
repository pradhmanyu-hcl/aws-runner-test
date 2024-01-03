#NAT Gateway
resource "aws_eip" "eip" {
  count = length(var.availability_zone)
  domain = "vpc"
  tags = {
    Name = var.eip_tags[count.index]
  }
}

resource "aws_nat_gateway" "natgw" {
  count = length(var.availability_zone)
  allocation_id = aws_eip.eip[count.index].id
  subnet_id = var.subnet_id[count.index]
  tags = {
    Name = var.nat_tags[count.index]
  }
}

