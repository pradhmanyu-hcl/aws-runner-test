output "vpc" {
  value = aws_vpc.vpc.id
}

output "vpc_sec_cidr" {
  value = aws_vpc_ipv4_cidr_block_association.vpc_sec.id
}

output "pusnet" {
  value = aws_subnet.pusnet[*].id
}
output "prsnet" {
  value = aws_subnet.prsnet[*].id
}
output "dbsnet" {
  value = aws_subnet.dbsnet[*].id
}
