#Public Route Table
resource "aws_route_table" "purt" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.purt_tags
  }
}

#Private Route Table
resource "aws_route_table" "prrt" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.prrt_tags
  }
}

#Database Route Table
resource "aws_route_table" "dbrt" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.dbrt_tags
  }
}

#Routes
resource "aws_route" "public" {
  route_table_id = aws_route_table.purt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = var.igw
}

resource "aws_route" "private" {
  route_table_id = aws_route_table.prrt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = var.natgw
}

resource "aws_route" "name" {
  route_table_id = aws_route_table.dbrt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = var.natgw
}

#Route table associations
resource "aws_route_table_association" "purt-a" {
  count = var.resource_count
  route_table_id = aws_route_table.purt.id
  subnet_id = var.pusnet_id[count.index]
}

resource "aws_route_table_association" "prrt-a" {
  count = var.resource_count
  route_table_id = aws_route_table.prrt.id
  subnet_id = var.prsnet_id[count.index]
}

resource "aws_route_table_association" "dbrt-a" {
  count = var.resource_count
  route_table_id = aws_route_table.dbrt.id
  subnet_id = var.dbsnet_id[count.index]
}