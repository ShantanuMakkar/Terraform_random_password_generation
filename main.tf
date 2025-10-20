module "password_generation" {
  source            = "./_modules/password_generation"
  password_length   = var.password_length
  rotation_id       = var.rotation_id
  swap_id           = var.swap_id
}
