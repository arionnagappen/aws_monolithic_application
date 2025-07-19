variable "app_server_ids" {
  type = string
  description = "App Server ID"
}

variable "cpu_threshold" {
  type    = number
  description = "CPU Threshold"
  default = 70
}

variable "sns_topic_arn" {
  type = string
  description = "SNS Topic ARN"
}

variable "db_rds_id" {
  type = string
  description = "Database ID"
}
variable "rds_storage_threshold" {
  type = number
  description = "Database Storage Threshold"
  default = 5368709120
}

variable "asg_name" {
  type = string
}

variable "asg_policy_arn" {
  type = string
}
