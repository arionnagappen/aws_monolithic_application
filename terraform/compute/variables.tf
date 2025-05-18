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