#security group for ec2
resource "aws_security_group" "sgec2" {
  vpc_id = var.vpc_id
  name = var.sgec2_name
  ingress {
    from_port = var.sgec2_ingress_from_port
    to_port = var.sgec2_ingress_to_port
    protocol = var.sgec2_ingress_protocol
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port = var.sgec2_egress_from_port
    to_port = var.sgec2_egress_to_port
    protocol = var.sgec2_egress_protocol
    cidr_blocks = [var.vpc_cidr]
  }
  tags = {
    Name = var.sgec2_tags
  }
}

#iam role
resource "aws_iam_role" "ssmrole" {
  name = var.ssmrole_name
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
resource "aws_iam_role_policy_attachment" "ssm" {
  role = aws_iam_role.ssmrole.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

#instance profile
resource "aws_iam_instance_profile" "ec2" {
  name = var.instance_profile
  role = aws_iam_role.ssmrole.id
}

#ec2 instance
resource "aws_instance" "awsec2l" {
  count = 3
  ami = var.ami
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2.name
  availability_zone     = count.index == 2 ? var.availability_zone[1] : var.availability_zone[0]
  vpc_security_group_ids = [aws_security_group.sgec2.id]
  subnet_id = var.subnet_id[count.index]

  root_block_device {
    delete_on_termination = var.delete_on_termination
  }
  
   ebs_block_device {
    device_name = "/dev/sdf"  # Replace with your desired mount point
    volume_size = var.rails_ebs_volume_size
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
    Name = var.ec2_tags[count.index]
  }
}


/*
#Autoscaling Launch Configuration
resource "aws_launch_configuration" "aslc_ec2_rails" {
  name = var.launch_conf_name_rails
  image_id = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.sgec2.id]
  lifecycle {
    create_before_destroy = true
  }
}

#Autoscaling Group
resource "aws_autoscaling_group" "asg" {
  name = var.autoscaling_group_name_rails
  vpc_zone_identifier = var.subnet_id
  launch_configuration = aws_launch_configuration.aslc_ec2_rails.name
  min_size = var.min_size_rails
  max_size = var.max_size_rails
  health_check_grace_period = var.health_check_grace_period_rails
  health_check_type = var.health_check_type_rails
  force_delete = var.force_delete_rails
  tag {
    key = "Name"
    value = "Rails Web Server launched through autoscaling"
    propagate_at_launch = true
  }
}
*/