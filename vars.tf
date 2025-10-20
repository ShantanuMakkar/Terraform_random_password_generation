variable "password_length" {
  description = "Length of the password"
  type        = number
}

# Persistent rotation ID (timestamps or strings)
variable "rotation_id" {
  type    = string
  default = "none"
}

# Persistent swap ID (timestamps or strings)
variable "swap_id" {
  type    = string
  default = "none"
}