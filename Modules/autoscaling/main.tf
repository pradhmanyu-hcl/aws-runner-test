#Autoscaling Launch Configuration
resource "aws_launch_configuration" "aslc" {
  name = var.launch_conf_name
  image_id = var.ami
  instance_type = var.instance_type
  security_groups = [var.security_group]
  lifecycle {
    create_before_destroy = true
  }
}

#Autoscaling Group
resource "aws_autoscaling_group" "asg" {
  name = var.autoscaling_group_name
  vpc_zone_identifier = var.subnet_id
  launch_configuration = aws_launch_configuration.aslc.name
  min_size = var.min_size
  max_size = var.max_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type = var.health_check_type
  force_delete = var.force_delete
  tag {
    key = "Name"
    value = "Launched through autoscaling"
    propagate_at_launch = true
  }
}

