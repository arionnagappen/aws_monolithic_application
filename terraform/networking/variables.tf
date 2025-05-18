// NETWORKING VARIABLES
variable "availability_zones" {
  type = list(string)
  description = "List of Availability Zones"
  default = [ "af-south-1a", "af-south-1b" ]
}
variable "public_subnet_cidrs" {
  type = list(string)
  description = "Public Subnet CIDR values"
  default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

variable "app_subnet_cidrs" {
  type = list(string)
  description = "Private Subnet CIDR values"
  default = [ "10.0.3.0/24", "10.0.4.0/24" ]
}

variable "database_subnet_cidrs" {
  type = list(string)
  description = "Database Subnet CIDR values"
  default = [ "10.0.5.0/24", "10.0.6.0/24" ]
}