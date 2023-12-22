output "eip" {
  value = aws_eip.eip[*].id
}
output "natgw" {
  value = aws_nat_gateway.natgw[*].id
}