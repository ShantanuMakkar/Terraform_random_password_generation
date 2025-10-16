output "active_password" {
  value     = local.active_final
  sensitive = true
}

output "backup_password" {
  value     = local.backup_final
  sensitive = true
}