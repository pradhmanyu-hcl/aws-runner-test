# public route table
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags   = {
    Name = "public-route-table"
  }
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  tags   = {
    Name = "private-route-table"
  }
}

# Route to Internet Gateway in public RT
resource "aws_route" "public_igw" {
  route_table_id = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

# Route to NAT Gateway in private RT
resource "aws_route" "private_nat_gateway" {
  route_table_id = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.natgw.id[*]
}

resource "aws_route_table_association" "pusnet_public_association" {
  count = length(aws_subnet.pusnet)
  subnet_id = aws_subnet.pusnet[count.index].id
  route_table_id = aws_route_table.public.id
}
 
 
resource "aws_route_table_association" "prsnet_private_association" {
  count = length(aws_subnet.prsnet)
  subnet_id = aws_subnet.prsnet[count.index].id
  route_table_id = aws_route_table.private.id
}
 
resource "aws_route_table_association" "dbsnet_private_association" {
  count = length(aws_subnet.dbsnet)
  subnet_id = aws_subnet.dbsnet[count.index].id
  route_table_id = aws_route_table.private.id
}