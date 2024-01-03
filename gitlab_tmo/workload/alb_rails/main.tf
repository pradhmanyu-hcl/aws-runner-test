<<<<<<< HEAD
#security group for alb
resource "aws_security_group" "sgalb" {
  vpc_id = var.vpc_id
  name = var.sgalb_name
  tags = {
    Name = var.sgalb_tags
  }
}


resource "aws_security_group_rule" "sgalbrule1" {
  security_group_id = aws_security_group.sgalb.id
  type = var.sgalb_type
  from_port = var.sgalb_from_port
  to_port = var.sgalb_to_port
  protocol = var.sgalb_protocol
  cidr_blocks = [var.vpc_cidr]
}

#Application load balancer
resource "aws_lb" "awslb" {
  name = var.alb_name
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.sgalb.id]
  subnets = var.subnets
  enable_deletion_protection = var.enable_deletion_protection
  tags = {
    Name = var.alb_tags
  }
}

#Listener
resource "aws_lb_listener" "ls" {
  load_balancer_arn = aws_lb.awslb.arn
  port = var.listener_port
  protocol = var.listener_protocol
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

#Target Group
resource "aws_lb_target_group" "tg" {
  name = var.alb_tg_name
  port = var.tg_port
  protocol = var.tg_protocol
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
  count = length(var.availability_zone)
  target_group_arn = aws_lb_target_group.tg.arn
  port = var.tg_port
  target_id = var.target_id[count.index]
=======
#security group for alb
resource "aws_security_group" "sgalb" {
  vpc_id = var.vpc_id
  name = var.sgalb_name
  tags = {
    Name = var.sgalb_tags
  }
}


resource "aws_security_group_rule" "sgalbrule1" {
  security_group_id = aws_security_group.sgalb.id
  type = var.sgalb_type
  from_port = var.sgalb_from_port
  to_port = var.sgalb_to_port
  protocol = var.sgalb_protocol
  cidr_blocks = [var.vpc_cidr]
}

#Application load balancer
resource "aws_lb" "awslb" {
  name = var.alb_name
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.sgalb.id]
  subnets = var.subnets
  enable_deletion_protection = var.enable_deletion_protection
  tags = {
    Name = var.alb_tags
  }
}

#Listener
resource "aws_lb_listener" "ls" {
  load_balancer_arn = aws_lb.awslb.arn
  port = var.listener_port
  protocol = var.listener_protocol
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}

#Target Group
resource "aws_lb_target_group" "tg" {
  name = var.alb_tg_name
  port = var.tg_port
  protocol = var.tg_protocol
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
  count = length(var.availability_zone)
  target_group_arn = aws_lb_target_group.tg.arn
  port = var.tg_port
  target_id = var.target_id[count.index]
>>>>>>> 374f69e284680e4c00db5732080818999ea80ab9
}