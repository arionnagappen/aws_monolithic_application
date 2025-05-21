// NETWORKING VARIABLES
variable "vpc_cidr" {
  type = string
  description = "VPC CIDR Block"
}
variable "availability_zones" {
  type = list(string)
  description = "List of Availability Zones"
}
variable "public_subnet_cidrs" {
  type = list(string)
  description = "Public Subnet CIDR values"
}

variable "app_subnet_cidrs" {
  type = list(string)
  description = "Private Subnet CIDR values"
}

variable "database_subnet_cidrs" {
  type = list(string)
  description = "Database Subnet CIDR values"
}