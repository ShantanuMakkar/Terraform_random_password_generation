#!/bin/bash
set -e

echo "Running precheck validation"
python3 check.py

echo "Running Terraform plan"
terraform plan

echo "Running Terraform apply"
terraform apply -auto-approve