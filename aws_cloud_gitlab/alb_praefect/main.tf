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

# Note: No need for Target Group with Network Load Balancer






















/*#security group for alb
resource "aws_security_group" "sgalb_praefect" {
  vpc_id = var.vpc_id
  name = var.sgalb_praefect_name
  tags = {
    Name = var.sgalb_praefect_tags
  }
}

resource "aws_security_group_rule" "sgalb_praefectrule1" {
  security_group_id = aws_security_group.sgalb_praefect.id
  type = var.sgalb_praefect_type
  from_port = var.sgalb_praefect_from_port
  to_port = var.sgalb_praefect_to_port
  protocol = var.sgalb_praefect_protocol
  cidr_blocks = [var.vpc_cidr]
}

#Application load balancer
resource "aws_lb" "awslb_praefect" {
  name = var.alb_praefect_name
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.sgalb_praefect.id]
  subnets = var.subnets
  enable_deletion_protection = var.praefect_enable_deletion_protection
  tags = {
    Name = var.alb_praefect_tags
  }
}

#Listener
resource "aws_lb_listener" "ls_praefect" {
  load_balancer_arn = aws_lb.awslb_praefect.arn
  port = var.listener_praefect_port
  protocol = var.listener_praefect_protocol
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg_praefect.arn
  }
}

#Target Group
resource "aws_lb_target_group" "tg_praefect" {
  name = var.alb_tg_prafect_name
  port = var.tg_praefect_port
  protocol = var.tg_praefect_protocol
  vpc_id = var.vpc_id
  health_check {
    healthy_threshold = var.praefect_healthy_threshold
    unhealthy_threshold = var.praefect_unhealthy_threshold
    timeout = var.praefect_timeout
    path = "/"
  }
}

#Target Group Attachment
resource "aws_lb_target_group_attachment" "tg-ap" {
  count = length(var.availability_zone)
  target_group_arn = aws_lb_target_group.tg_praefect.arn
  port = var.tg_praefect_port
  target_id = var.target_id[count.index]
}*/