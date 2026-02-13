variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "tf-example"
}


variable "subnet_id" {
  description = "Public Subnet ID for NAT Gateway"
  type        = string
}

variable "allocation_id" {
  description = "Elastic IP allocation ID"
  type        = string
}

variable "internet_gateway_id" {
  description = "Internet Gateway ID for dependency"
  type        = string
}