output "backup_vault" {
  value = aws_backup_vault.bv.id
}

output "backup_plan" {
  value = aws_backup_plan.bp.id
}