#Create CMK
resource "aws_kms_key" "test" {
  key_usage = var.key_usage
  multi_region = var.multi_region
  customer_master_key_spec = var.spec
  enable_key_rotation = var.key_rotation
  deletion_window_in_days = var.deletion_window
  tags = {
    Name = var.tags
  }
}

#Create alias
resource "aws_kms_alias" "test" {
  name = "alias/${var.alias}"
  target_key_id = aws_kms_key.test.id
}