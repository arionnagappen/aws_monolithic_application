// NETWORKING VARIABLES //

// Vpc Variables//
variable "vpc_cidr" {
  type = string
  description = "VPC CIDR Block"
}
variable "availability_zones" {
  type = list(string)
  description = "List of Availability Zones"
}

variable "vpc_tag" {
  type = string
  description = "Tag the VPC with a name"
}

// Subnet Variables //
variable "public_subnet_cidrs" {
  type = list(string)
  description = "Public Subnet CIDR values"
}

variable "pub_subnet_tag" {
  type = string
  description = "Tag the Public Subnet with a name"
}

variable "app_subnet_cidrs" {
  type = list(string)
  description = "Private Subnet CIDR values"
}

variable "app_subnet_tag" {
  type = string
  description = "Tag the App Subnet with a name"
}

variable "database_subnet_cidrs" {
  type = list(string)
  description = "Database Subnet CIDR values"
}

variable "database_subnet_tag" {
  type = string
  description = "Tag the Database Subnet with a name"
}