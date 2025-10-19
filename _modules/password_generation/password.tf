resource "random_password" "active" {
  length  = var.password_length
  special = true
}

resource "random_password" "backup" {
  length  = var.password_length
  special = true
  keepers = {
    rotate_backup = var.rotate_backup
  }
}

resource "random_password" "backup_rotated" {
  count   = var.rotate_backup ? 1 : 0
  length  = var.password_length
  special = true
}
