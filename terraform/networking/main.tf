// --- VPC ---
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "My VPC"
  }
}

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

// --- INTERNET GATEWAY ---
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

// --- ROUTE ASSOCIATION FOR IGW
resource "aws_route_table" "route_internet_traffic" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "Route Internet Traffic to VPC"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count = length(var.public_subnet_cidrs)
  subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.route_internet_traffic.id
}



// --- NAT GATEWAY ---


