output "active_password" {
  value     = module.password_generation.active_password
  sensitive = true
}

output "backup_password" {
  value     = module.password_generation.backup_password
  sensitive = true
}