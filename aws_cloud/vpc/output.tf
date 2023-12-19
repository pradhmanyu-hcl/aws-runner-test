output "vpc" {
  value = aws_vpc.vpc.id
}

output "vpc_sec_cidr" {
  value = aws_vpc_ipv4_cidr_block_association.vpc_sec.id
}