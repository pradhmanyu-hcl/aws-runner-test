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
  policy_arn = "arn:aws-us-gov:iam::aws:policy/AmazonSSMManagedInstanceCore"
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
 

  vpc_security_group_ids = [aws_security_group.sgec2_gitlay.id]
    availability_zone      = var.availability_zone[count.index % length(var.availability_zone)]
  
    subnet_id             = element(var.subnet_id, count.index)
  root_block_device {
    delete_on_termination = var.gitlay_delete_on_termination
  }


  ebs_block_device {
    device_name = "/dev/sdf"  # Replace with your desired mount point
    volume_size = var.gitlay_ebs_volume_size
  }

  user_data = <<EOF
  #!/bin/bash
  sudo dnf install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm

  sudo dnf install -y curl policycoreutils openssh-server perl
  # Enable OpenSSH server daemon if not enabled: sudo systemctl status sshd
  sudo systemctl enable sshd
  sudo systemctl start sshd
  # Check if opening the firewall is needed with: sudo systemctl status firewalld
  sudo firewall-cmd --permanent --add-service=http
  sudo firewall-cmd --permanent --add-service=https
  sudo systemctl reload firewalld

  sudo dnf install postfix
  sudo systemctl enable postfix
  sudo systemctl start postfix


  curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | sudo bash

  # sudo EXTERNAL_URL="http://gitlab-loadbalancer-595409493.us-west-2.elb.amazonaws.com" dnf install -y gitlab-ee




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