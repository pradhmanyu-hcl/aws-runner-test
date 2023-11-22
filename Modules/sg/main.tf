#sg
resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id
  name = var.sg_name
  ingress {
    from_port = var.from_port
    to_port = var.to_port
    protocol = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [var.vpc_cidr]
  }
  tags = {
    Name = var.sg_tags
  }
}