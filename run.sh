#!/bin/bash
set -e

echo "****-------------------------****"
echo "Starting the process to trigger the external python script to validate if both backup rotation and swap are not being initiated together .."
echo "Running precheck validations"
python3 check.py

echo "Running Terraform plan.."
terraform plan

echo "Running Terraform apply.."
terraform apply -auto-approve

echo "****-------------------------****"
echo "Terraform is successful.."
