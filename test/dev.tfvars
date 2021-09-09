# Auto Fill variables for DEV

#File names can be  as:
# terraform.tfvars
# prod.auto.tfvars
# dev.auto.tfvars


region = "us-east-2"
instance_type"  = "t3.small"
allow_ports" = ["80", "443", "22", "8080"]

common_tags = {
    Owner       = "Aynur Garipov"
    Project     = "Learn"
    CostCenter  = "12345"
    Environment = "Devан"
  }
