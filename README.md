# Terraform_random_password_generation

Overview

This Terraform project provides a reusable module to manage two passwords: an active and a backup password. It supports rotating only the backup password and optionally swapping the active and backup passwords.

Folder Structure
	•	Terraform_random_password_generation/
		•	_modules/
			•	password_generation/
				•	password.tf
				•	local.tf
				•	vars.tf
				•	outputs.tf		
	
	•	main.tf
	•	vars.tf
	•	outputs.tf
	•	terraform.tfvars
	•	README.md
	
	•	guard/
		•	precheck.go

Features
	•	Two Passwords: Generates one active and one backup password.
	•	Rotation: You can rotate the backup password independently.
	•	Swap: Swap active and backup passwords when needed.
	•	Idempotent: Terraform does not recreate passwords unless explicitly told to.

How It Works
	1.	When you first run terraform apply, two passwords (active and backup) are generated.
	2.	To rotate the backup password, set rotate_backup = true and apply again.
	3.	To swap passwords, set swap_passwords = true and apply again.
	4.	The state will remain stable across runs unless you change these flags.

Usage Example

module “password_generation” {
source          = “./_modules/password_generation”
password_length = 20
include_special = true
rotate_backup   = false
swap_passwords  = false
}

output “active_password” {
value     = module.password_generation.active_password
sensitive = true
}

output “backup_password” {
value     = module.password_generation.backup_password
sensitive = true
}

Apply Steps
	1.	Initialize Terraform: terraform init
	2.	Apply the configuration: terraform apply -auto-approve
	3.	To rotate the backup password: terraform apply -var=“rotate_backup=true” -auto-approve
	4.	To swap passwords: terraform apply -var=“swap_passwords=true” -auto-approve

Notes
	•	The module is substrate agnostic and works with any Terraform backend.
	•	It achieves the desired state within a maximum of two terraform apply runs.
	•	Backup password rotation and password swapping are mutually exclusive operations (handled separately).
