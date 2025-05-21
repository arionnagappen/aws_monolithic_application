variable "vpc_id" {
  type = string
  description = "VPC ID to launch RDS instance into"
}
variable "availability_zones" {
  type = list(string)
  description = "List of availability zones"
}

variable "app_subnet_ids" {
  type = list(string)
  description = "List of app server IDs"
}

variable "database_subnet_ids" {
  type = list(string)
  description = "List of database subnet IDs"
}

variable "app_server_sg_id" {
  type = string
  description = "App server's security group ID"
}

// --- SECRETS MANAGER ---

data "aws_secretsmanager_secret" "rds-creds" {
  name = "rds-credentials"
}

data "aws_secretsmanager_secret_version" "rds_version" {
  secret_id = data.aws_secretsmanager_secret.rds-creds.id
}

locals {
  rds_creds = jsondecode(data.aws_secretsmanager_secret_version.rds_version.secret_string)
}