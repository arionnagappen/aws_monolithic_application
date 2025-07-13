// --- DATABASE SUBNET GROUP ---
variable "db_subnet_group_name" {
  type = string
  description = "Database subnet group name"
}

variable "db_subnet_group_tag" {
  type = string
  description = "Database subnet group tag"
}

// --- DATABASE INSTANCE ---
variable "db_identifier" {
  type = string
  description = "Database Identifier"
}

variable "db_engine" {
  type = string
  description = "Database Engine"
}

variable "db_eng_version" {
  type = string
  description = "Database Engine Version"
}

variable "db_inst_class" {
  type = string
  description = "Database Instance Class"
}

variable "db_storage_size" {
  type = number
  description = "Database Storage Size"
}

variable "secret_name" {
  type = string
  description = "Name of secret in Secrets Manager"
}

// --- FROM NETWORK ---
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

// --- COMPUTE IDs
variable "app_server_sg_id" {
  type = string
  description = "App server's security group ID"
}

// SECURITY
variable "kms_key_id" {
  type = string
}