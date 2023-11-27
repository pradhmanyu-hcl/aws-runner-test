#aws backup vault
resource "aws_backup_vault" "bv" {
  name = var.vault_name
  #kms_key_arn = aws_kms_key.test.arn        #in case CMK used
  force_destroy = true
  tags = {
    Name = var.vault_tags
  }
}

#aws backup plan
resource "aws_backup_plan" "bp" {
  name = var.plan_name

  rule {
    rule_name = var.rule_name
    target_vault_name = aws_backup_vault.bv.name
    schedule = var.schedule

    lifecycle {
      cold_storage_after = var.cold_storage_after_days
      delete_after = var.delete_after_days
    }
   }
  
  tags = {
    Name = var.plan_tags
  }
}