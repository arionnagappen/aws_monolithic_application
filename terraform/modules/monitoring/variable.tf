variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "alert_email" {
  type = string
  description = "Email to send an alarm notification"
}

variable "app_server_ids" {
  type = string
  description = "App Server ID"
}

variable "cpu_threshold" {
  type = number
  description = "CPU Threshold"
}

variable "db_rds_id" {
  type = string
  description = "Database ID"
}

variable "rds_storage_threshold" {
  type = number
  description = "Database storage threshold"
}

variable "asg_name" {
  type = string
}

variable "asg_policy_arn" {
  type = string
}