variable "vault_name" {
  description = "The vault name"
  type = string
  default = "Aws-backup-vault"
}
variable "plan_name" {
  description = "The name of backup plan"
  type = string
  default = "Aws-backup-plan-for-ec2"
}
variable "rule_name" {
  description = "The name of the rule"
  type = string
  default = "Daily-Backup-Rule"
}
variable "schedule" {
  description = "Backup schedule in cron expression"
  type = string
  default = "cron(0 12 * * ? *)"
}
variable "cold_storage_after_days" {
  description = "The number of days after which the backup will go to cold storage"
  type = number
  default = 15
}
variable "delete_after_days" {
  description = "The days after which the backup will be deleted"
  type = number
  default = 115
}
variable "vault_tags" {
  description = "tags associated to backup vault"
  type = string
  default = "awsgov_backup_vault_usw_ccoe_prd_001"
}
variable "plan_tags" {
  description = "tags associated with backup plan"
  type = string
  default = "awsgov_backup_plan_usw_ccoe_prd_001"
}