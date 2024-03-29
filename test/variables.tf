variable "region" {
  description = "Please Enter AWS Region to deploy Server"
  type        = string # Строка, может быть еще список
  default     = "us-east-2"
}

variable "instance_type" {
  description = "Enter Instance Type"
  type        = string
  default     = "t3.small"
}

variable "allow_ports" {
  description = "List of Ports to open for server"
  type        = list(any) # Список
  default     = ["80", "443", "22", "8080"]
}

variable "common_tags" {
  description = "Common Tags to apply to all resources"
  type        = map
  default = {
    Owner       = "Aynur Garipov"
    Project     = "Learn"
    CostCenter  = "12345"
    Environment = "DevOps"
  }
}
