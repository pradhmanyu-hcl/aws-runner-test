#NLB
resource "aws_lb" "nlb" {
  name = var.nlb_name
  internal = false
  load_balancer_type = "network"
  subnets = var.subnets   #subnets in which nlb will balance the load, values are defined in variables
  enable_deletion_protection = var.enable_deletion_protection
  tags = {
    Name = var.tags
  }
}

#Listener
resource "aws_lb_listener" "nlbls" {
  load_balancer_arn = aws_lb.nlb.arn
  port = var.port
  protocol = var.protocol
  #certificate_arn = ""        #For TLS connections only
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tgnlb.arn
  }
}

#Target Group
resource "aws_lb_target_group" "tgnlb" {
  name = var.nlb_tg_name
  port = var.port
  protocol = var.protocol
  vpc_id = var.vpcid           #vpc in which the target group will be created, values given in variables
}
