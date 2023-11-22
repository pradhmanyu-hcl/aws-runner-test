#efs
resource "aws_efs_file_system" "efs" {
  creation_token = var.efs_name
  performance_mode = var.performance_mode
  throughput_mode = var.throughput_mode
  encrypted = var.encrypted
  tags = {
    Name = var.tags
  }
}