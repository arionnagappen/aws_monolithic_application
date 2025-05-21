// --- PUBLIC SUBNET ---
resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidrs)
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)

    tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}

// --- APP SERVER SUBNET (PRIVATE) ---
resource "aws_subnet" "app_server_subnet" {
  count = length(var.app_subnet_cidrs)
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = element(var.app_subnet_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "App Subnet ${count.index + 1}"
  }
}

// --- DATABASE SUBNET (PRIVATE) ---
resource "aws_subnet" "database_subnet" {
  count = length(var.database_subnet_cidrs)
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = element(var.database_subnet_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)

    tags = {
    Name = "Database Subnet ${count.index + 1}"
  }
}
