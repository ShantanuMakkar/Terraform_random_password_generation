variable "password_length" {
  description = "Length of the password"
  type        = number
}

variable "rotate_backup" {
  description = "Set to true to rotate only the backup password"
  type        = bool
}

variable "swap_passwords" {
  description = "Set to true to swap active and backup passwords"
  type        = bool
}