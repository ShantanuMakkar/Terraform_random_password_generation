locals {
  backup_password = var.rotate_backup ? random_password.backup_rotated[0].result : random_password.backup.result

  active_final = var.swap_passwords ? local.backup_password : random_password.active.result
  backup_final = var.swap_passwords ? random_password.active.result : local.backup_password
}
