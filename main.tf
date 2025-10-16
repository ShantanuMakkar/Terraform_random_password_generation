module "password_generation" {
  source          = "./_modules/password_regeneration"
  password_length = var.password_length
  rotate_backup   = var.rotate_backup
  swap_passwords  = var.swap_passwords
}
