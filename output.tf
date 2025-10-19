output "active_password" {
  value     = nonsensitive(module.password_generation.active_password)
  //sensitive = true
}

output "backup_password" {
  value     = nonsensitive(module.password_generation.backup_password)
  //sensitive = true
}