# Security group for NLB
resource "aws_security_group" "sgnlb_praefect" {
  vpc_id = var.vpc_id
  name   = var.sgnlb_praefect_name
  tags   = {
    Name = var.sgnlb_praefect_tags
  }
}

resource "aws_security_group_rule" "sgnlb_praefectrule1" {
  security_group_id = aws_security_group.sgnlb_praefect.id
  type              = var.sgnlb_praefect_type
  from_port         = var.sgnlb_praefect_from_port
  to_port           = var.sgnlb_praefect_to_port
  protocol          = var.sgnlb_praefect_protocol
  cidr_blocks       = [var.vpc_cidr]
}

# Network Load Balancer
resource "aws_lb" "awslb_praefect" {
  name                      = var.nlb_praefect_name
  internal                  = false
  load_balancer_type        = "network"
  security_groups           = [aws_security_group.sgnlb_praefect.id]
  subnets                   = var.subnets
  enable_deletion_protection = var.praefect_enable_deletion_protection
  tags                      = {
    Name = var.nlb_praefect_tags
  }
}

# Listener for Network Load Balancer
resource "aws_lb_listener" "ls_praefect" {
  load_balancer_arn = aws_lb.awslb_praefect.arn
  port              = var.listener_praefect_port
  protocol          = var.listener_praefect_protocol

  default_action {
    type = "forward"
  }
}

