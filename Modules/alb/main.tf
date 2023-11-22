#Application load balancer
resource "aws_lb" "awslb" {
  name = var.alb_name
  internal = false
  load_balancer_type = "application"
  security_groups = [var.security_group_id]
  subnets = var.subnets
  enable_deletion_protection = var.enable_deletion_protection
  tags = {
    Name = var.alb_tags
  }
}

#Listener
resource "aws_lb_listener" "ls" {
  load_balancer_arn = aws_lb.awslb.arn
  port = var.port
  protocol = var.protocol
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

#Target Group
resource "aws_lb_target_group" "tg" {
  name = var.alb_tg_name
  port = var.port
  protocol = var.protocol
  vpc_id = var.vpc_id
  health_check {
    healthy_threshold = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout = var.timeout
    path = "/"
  }
}

#target Group Attachment
resource "aws_lb_target_group_attachment" "tg-a" {
  count = var.resource_count
  target_group_arn = aws_lb_target_group.tg.arn
  port = var.port
  target_id = var.target_id[count.index]
}
