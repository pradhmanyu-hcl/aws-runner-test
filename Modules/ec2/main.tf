#ec2 instance
resource "aws_instance" "awsec2l" {
  count = length(var.availability_zone)
  ami = var.ami
  instance_type = var.instance_type
  availability_zone = var.availability_zone[count.index]
  vpc_security_group_ids = [var.security_group_id]
  subnet_id = var.subnet_id[count.index]
  root_block_device {
    delete_on_termination = var.delete_on_termination
  }
  user_data = <<EOF
  #!/bin/bash
mkdir /tmp/ssm
cd /tmp/ssm
wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb
sudo dpkg -i amazon-ssm-agent.deb
sudo start amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent
EOF
  tags = {
    Name = var.ec2_tags[count.index]
  }
}