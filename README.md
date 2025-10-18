Terraform Random Password Generation :

This project demonstrates how to use Terraform to generate secure random passwords and manage them efficiently using modular structure and conditional deployment techniques.

The setup includes a Python-based precheck script that validates the environment before deployment, ensuring idempotency and safe provisioning.


Folder Structure -

	1.	Terraform_random_password_generation/

	2.	_modules/
	•	password_generation/
		•	password.tf
		•	local.tf
		•	vars.tf
		•	outputs.tf

	3.	main.tf
	4.	vars.tf
	5.	outputs.tf
	6.	terraform.tfvars

	7.	check.py
	8.	run.sh

	9.	README.md


Project Overview - 
	•	The Terraform configuration is organized into a reusable module that handles password generation.
	•	The password_generation module defines the logic to create random passwords.
	•	The root main.tf calls this module and controls execution flow.
	•	A Python precheck script (check.py) runs before Terraform commands to validate that required variables and files exist.
	•	This ensures idempotency — re-running Terraform will not regenerate passwords unless the inputs change.


Conditional Deployment - 
	•	Conditional deployment is used to control when and how resources are created based on variable conditions.
	•	For example, Terraform only generates a password if a flag such as create_password = true is set.
	•	This approach ensures that repeated runs do not modify existing resources unless explicitly required.


How to Run - 

	1.	Run the precheck to validate setup:
	•	bash run.sh
	
	2. Then run.sh will run the check.py script, which will read the terraform.tfvars file to validate the if the two variables are true at the same time.

	3. If the check.py succeeds, it will run the terraform commands plan & apply as a part of the bash script4

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