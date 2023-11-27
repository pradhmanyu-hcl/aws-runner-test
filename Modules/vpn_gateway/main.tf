#aws vpn gateway
resource "aws_vpn_gateway" "vpngw" {
  vpc_id = var.vpc_id                    
  tags = {
    Name = var.vpn_gateway_tags
  }
}

#vpn gateway attachment
resource "aws_vpn_gateway_attachment" "vpngw-a" {
  vpc_id = var.vpc_id                     
  vpn_gateway_id = aws_vpn_gateway.vpngw.id
}

#customer gateway
resource "aws_customer_gateway" "cgw" {
  bgp_asn = var.bgp_asn
  ip_address = var.ip_address
  type = var.type
  tags = {
    Name = var.customer_gateway_tags
  }
}