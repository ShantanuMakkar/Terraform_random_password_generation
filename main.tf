module "password_generation" {
  source          = "./_modules/password_generation"
  password_length = var.password_length
  rotate_backup   = var.rotate_backup
  swap_passwords  = var.swap_passwords
}
