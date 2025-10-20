locals {
  active_final = var.swap_id != "none" ? random_password.backup.result : random_password.active.result
  backup_final = var.swap_id != "none" ? random_password.active.result : random_password.backup.result
}