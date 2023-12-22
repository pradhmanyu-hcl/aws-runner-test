#security group for ec2 gitlay
resource "aws_security_group" "sgec2_gitlay" {
  vpc_id = var.vpc_id
  name = var.sgec2_gitlay_name
  ingress {
    from_port = var.sgec2_gitlay_ingress_from_port
    to_port = var.sgec2_gitlay_ingress_to_port
    protocol = var.sgec2_gitlay_ingress_protocol
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port = var.sgec2_gitlay_egress_from_port
    to_port = var.sgec2_gitlay_egress_to_port
    protocol = var.sgec2_gitlay_egress_protocol
    cidr_blocks = [var.vpc_cidr]
  }
  tags = {
    Name = var.sgec2_gitlay_tags
  }
}

#iam role
resource "aws_iam_role" "ssmgitlay" {
  name = var.ssmgitlayrole_name
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
resource "aws_iam_role_policy_attachment" "ssmgitlay" {
  role = aws_iam_role.ssmgitlay.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

#instance profile
resource "aws_iam_instance_profile" "ec2gitlay" {
  name = var.instance_profile_gitlay
  role = aws_iam_role.ssmgitlay.id
}

#ec2 instance
resource "aws_instance" "ec2gitlay" {
  count                 = 3
  ami                   = var.gitlay_ami
  instance_type         = var.gitlay_instance_type
  iam_instance_profile  = aws_iam_instance_profile.ec2gitlay.name
  availability_zone     = count.index == 2 ? var.availability_zone[1] : var.availability_zone[0]
  vpc_security_group_ids = [aws_security_group.sgec2_gitlay.id]
  subnet_id             = var.subnet_id[count.index]

  root_block_device {
    delete_on_termination = var.gitlay_delete_on_termination
  }

  ebs_block_device {
    device_name = "/dev/sdf"  # Replace with your desired mount point
    volume_size = var.gitlay_ebs_volume_size
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
    Name = var.ec2gitlay_tags[count.index]
  }
}