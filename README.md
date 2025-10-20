Terraform Random Password Generation Module :

Overview - 

This Terraform module generates two random passwords: active and backup. It supports:
	1.	Password Generation: Creates initial active and backup passwords.
	2.	Backup Rotation: Regenerates the backup password when needed.
	3.	Password Swapping: Swap active and backup passwords safely.
	4.	Idempotency: Passwords only change when triggered by rotation or swap events.
	5.	Conditional Deployment: Can be used in Terraform projects to create resources selectively.


Features -
	•	Generate passwords with configurable length and special characters.
	•	Conditional regeneration using rotation_id and swap_id timestamps.
	•	Precheck validation to prevent rotation and swap at the same time using a Python script.
	•	Idempotent behavior ensures passwords remain unchanged unless explicitly triggered.


Folder Structure
	•	Terraform_random_password_generation/
		•	_modules/
			•	password_generation/
			•	password.tf → main password resources
			•	local.tf → local values and computed passwords
			•	vars.tf → input variables
			•	outputs.tf → output passwords (marked sensitive)
	•	main.tf → calls the module
	•	vars.tf → main module variables
	•	outputs.tf → outputs from main module
	•	terraform.tfvars → values for testing
	•	README.md → this file
	•	run.sh -> Bash script to run the whole flow
	•	check.py → validates rotation and swap timestamps

⸻

How It Works
	1.	Initial Creation:
		•	Both active and backup passwords are generated.
	2.	Backup Rotation:
		•	Triggered by changing rotation_id timestamp.
		•	Only backup password is regenerated; active remains unchanged.
	3.	Swap Passwords:
		•	Triggered by changing swap_id timestamp.
		•	Active and backup passwords are swapped.
		•	Rotation and swap cannot occur at the same timestamp (precheck Python script ensures this).
	4.	Idempotency:
		•	Passwords do not change on subsequent Terraform applies unless the timestamps are updated.
	5.	Conditional Deployment:
		•	Can control resource creation using variables.
		•	Used in real projects for AWS resources like RDS, storing passwords in Secrets Manager.


How to Run - 

	1.	Run the bash script, it triggers the precheck python script check.py (external tool) to validate the setup and run the terraform commands:
	•	bash run.sh 
		or 
		./run.sh
	
	2. The check.py script reads the terraform.tfvars file to validate the if the two variables for backup rotation and swapping are same or not.

	3. If the check.py succeeds, it will run the terraform commands plan & apply as a part of the bash script.

	4.	If you want to skip the bonus validation part, directly perform the Terraform commands as below:
	•	terraform init
	•	terraform plan
	•	terraform apply


Key Features - 
	•	Modular design for password generation
	•	Python-based precheck guard for validation
	•	Idempotent execution — no unintended password regeneration
	•	Conditional deployment logic for flexibility
	•	Real-world alignment with production Terraform practices


Real-World Implementation Experience (In my current project) -

In my current project, I have extensively used conditional deployment across almost all AWS resources in Terraform.
This ensures efficient and controlled deployments — for instance, creating RDS instances, S3 buckets, or IAM roles only when specific feature flags are enabled.

I also implemented random password generation for RDS databases using the same concept as this module.
The generated passwords were securely stored directly in AWS Secrets Manager using a key pair, ensuring both security and automation without exposing credentials in plain text.