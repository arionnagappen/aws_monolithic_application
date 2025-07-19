# --- NAT GATEWAY ---

# Create an Elastic IP for NAT
resource "aws_eip" "nat_eip" {
  count = length(aws_subnet.app_server_subnet)
  domain = "vpc"

  tags = {
    Name = "NAT EIP Public Subnet ${count.index + 1}"
  }
}

# Create NAT Gateway in the first public subnet
resource "aws_nat_gateway" "nat_gw" {
  count = length(aws_subnet.app_server_subnet)
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.public_subnets[count.index].id
  depends_on    = [aws_internet_gateway.my_igw]

  tags = {
    Name = "NAT Gateway Public Subnet ${count.index + 1}"
  }
}

# Create a single route table for all private subnets
resource "aws_route_table" "nat_route" {
  count = length(var.app_subnet_cidrs)
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw[count.index].id
  }

  tags = {
    Name = "NAT Gateway Route Table ${count.index + 1}"
  }
}

# Associate that route table with each private (app) subnet
resource "aws_route_table_association" "nat_assoc" {
  count          = length(var.app_subnet_cidrs)
  subnet_id      = aws_subnet.app_server_subnet[count.index].id
  route_table_id = aws_route_table.nat_route[count.index].id
}
