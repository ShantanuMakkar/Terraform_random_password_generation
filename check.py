import sys
import os

def main():
    file_path = "terraform.tfvars"

    if not os.path.exists(file_path):
        print(f" Could not find {file_path}")
        sys.exit(1)

    rotate_backup = False
    swap_passwords = False

    # Reading terraform.tfvars 
    with open(file_path, "r") as f:
        for line in f:
            line = line.strip()
            if line.startswith("rotate_backup"):
                rotate_backup = "true" in line.lower()
            elif line.startswith("swap_passwords"):
                swap_passwords = "true" in line.lower()

    # Validation check
    if rotate_backup and swap_passwords:
        print("Error: You cannot rotate and swap passwords at the same time.")
        sys.exit(1)
    else:
        print("Validation passed. Safe to run terraform apply.")
        sys.exit(0)

if __name__ == "__main__":
    main()