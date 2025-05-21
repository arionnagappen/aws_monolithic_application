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