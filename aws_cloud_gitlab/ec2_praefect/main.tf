#security group for ec2 praefect
resource "aws_security_group" "sgec2_praefect" {
  vpc_id = var.vpc_id
  name = var.sgec2_praefect_name
  ingress {
    from_port = var.sgec2_praefect_ingress_from_port
    to_port = var.sgec2_praefect_ingress_to_port
    protocol = var.sgec2_praefect_ingress_protocol
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port = var.sgec2_praefect_egress_from_port
    to_port = var.sgec2_praefect_egress_to_port
    protocol = var.sgec2_praefect_egress_protocol
    cidr_blocks = [var.vpc_cidr]
  }
  tags = {
    Name = var.sgec2_praefect_tags
  }
}

#iam role
resource "aws_iam_role" "ssmpraefect" {
  name = var.ssmpraefectrole_name
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  }
  EOF
}

#ssm policy addition to the role
resource "aws_iam_role_policy_attachment" "ssmpraefect" {
  role = aws_iam_role.ssmpraefect.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

#instance profile
resource "aws_iam_instance_profile" "ec2praefect" {
  name = var.instance_profile_praefect
  role = aws_iam_role.ssmpraefect.id
}

#ec2 instance
resource "aws_instance" "ec2praefect" {
  count                 = 3
  ami = var.praefect_ami
  instance_type = var.praefect_instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2praefect.name
  availability_zone     = count.index == 2 ? var.availability_zone[1] : var.availability_zone[0]
  vpc_security_group_ids = [aws_security_group.sgec2_praefect.id]
  subnet_id = var.subnet_id[count.index]

  root_block_device {
    delete_on_termination = var.praefect_delete_on_termination
  }

   ebs_block_device {
    device_name = "/dev/sdf"  # Replace with your desired mount point
    volume_size = var.praefect_ebs_volume_size
  }
  user_data = <<EOF
  #!/bin/bash
  sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
  sudo systemctl enable amazon-ssm-agent
  sudo systemctl start amazon-ssm-agent
  
  # Update system repositories
  yum update -y

  # Download required FIPS packages
  yum install -y \
  kernel-fips \
  kernel-modules-fips \
  kernel-tools-fips \
  fips-libcrypto \
  fips-libssl

  # Enable FIPS mode
  echo "fips=yes" >> /etc/modprobe.d/fips.conf

  # Update kernel modules
  dracut -f

  # Restart services requiring FIPS mode
  systemctl restart crond
  systemctl restart sshd

  # Verify FIPS status
  fips-verify

  # Optional: Cleanup temporary files or logs

  # Reboot the system (recommended)
  reboot


  EOF
  tags = {
    Name = var.ec2praefect_tags[count.index]
  }
}
/*
#Autoscaling Launch Configuration
resource "aws_launch_configuration" "aslc_praefect" {
  name = var.launch_conf_name_praefect
  image_id = var.praefect_ami
  instance_type = var.praefect_ami
  security_groups = [aws_security_group.sgec2_praefect.id]
  lifecycle {
    create_before_destroy = true
  }
}

#Autoscaling Group
resource "aws_autoscaling_group" "asg" {
  name = var.autoscaling_group_name_praefect
  vpc_zone_identifier = var.subnet_id
  launch_configuration = aws_launch_configuration.aslc_praefect.name
  min_size = var.min_size_praefect
  max_size = var.max_size_praefect
  health_check_grace_period = var.health_check_grace_period_praefect
  health_check_type = var.health_check_type_praefect
  force_delete = var.force_delete_praefect
  tag {
    key = "Name"
    value = "Praefect Server launched through Autoscaling"
    propagate_at_launch = true
  }
}
*/