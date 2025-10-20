# Active password: never rotates automatically
resource "random_password" "active" {
  length  = var.password_length
  special = true
  keepers = {
    static = "active_base"   # Just a static key/value to prevent Terraform from recreating the active password
  }
}

# Backup password: rotates only when rotation_id changes
resource "random_password" "backup" {
  length  = var.password_length
  special = true
  keepers = {
    rotation_id = var.rotation_id
  }
}
