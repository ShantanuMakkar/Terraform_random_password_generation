import sys
from datetime import datetime

def get_ids(file="terraform.tfvars"):
    rotation, swap = "none", "none"
    with open(file) as f:
        for line in f:
            line = line.split("#")[0].strip()  # remove comments
            if line.startswith("rotation_id"):
                rotation = line.split("=")[1].strip().strip('"')
            elif line.startswith("swap_id"):
                swap = line.split("=")[1].strip().strip('"')
    return rotation, swap

def to_dt(ts):
    return None if ts.lower() == "none" else datetime.fromisoformat(ts)

rotation_id, swap_id = get_ids()
if to_dt(rotation_id) == to_dt(swap_id) and rotation_id.lower() != "none":
    print("Error: rotation_id and swap_id cannot be the same timestamp!")
    sys.exit(1)

print("Validation passed. Safe to run terraform apply.")
sys.exit(0)