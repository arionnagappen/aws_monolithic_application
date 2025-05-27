variable "inst_ami" {
  type = string
  description = "AMI of the instance"
}

variable "inst_type" {
  type = string
  description = "Instance Type"
}

// --- FROM NETWORKING MODULE ---
variable "vpc_id" {
  type = string
  description = "VPC ID to launch EC2 instance into"
}
variable "availability_zones" {
  type = list(string)
  description = "List of availability zones"
}

variable "public_subnet_ids" {
  type = list(string)
  description = "List of public subnet IDs"
}

variable "app_subnet_ids" {
  type = list(string)
  description = "List of app server IDs"
}

variable "database_subnet_ids" {
  type = list(string)
  description = "List of database subnet IDs"
}

// SECURITY MODULE
variable "app_server_iam_profile_name" {
  type = string
}