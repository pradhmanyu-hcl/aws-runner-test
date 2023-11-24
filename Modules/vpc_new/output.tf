output "vpc_id" {
  value = aws_vpc.vpc.id
}
output "sec_cidr" {
  value = aws_vpc_ipv4_cidr_block_association.vpc_sec_cidr
}