<<<<<<< HEAD
output "eip" {
  value = aws_eip.eip[*].id
}
output "natgw" {
  value = aws_nat_gateway.natgw[*].id
}

output "nat_gateway_ids" {
  value = aws_nat_gateway.natgw[*].id
=======
output "eip" {
  value = aws_eip.eip[*].id
}
output "natgw" {
  value = aws_nat_gateway.natgw[*].id
}

output "nat_gateway_ids" {
  value = aws_nat_gateway.natgw[*].id
>>>>>>> 374f69e284680e4c00db5732080818999ea80ab9
}