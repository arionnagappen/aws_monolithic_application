// --- NAT GATEWAY ---

# Creates an Elastic IP Address for the NAT Gateway
resource "aws_eip" "nat_eip" {
  count = length(aws_subnet.public_subnets)
  domain = "vpc"

  tags = {
    Name = "NAT EIP Public Subnet ${count.index + 1}"
  }
}

# Creates the NAT Gateway for Private Subnets to Access the Internet
resource "aws_nat_gateway" "nat_gw" {
  count = length(aws_subnet.public_subnets)
  allocation_id = aws_eip.nat_eip[count.index].id # Attaches Elastic IP to NAT Gateway
  subnet_id = aws_subnet.public_subnets[count.index].id
  depends_on = [ aws_internet_gateway.my_igw ]

  tags = {
    Name = "NAT Gateway Public Subnet ${count.index + 1}"
    }
}

# Sends outbound traffic to the internet 
resource "aws_route_table" "nat_route" {
  count = length(aws_nat_gateway.nat_gw)
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw[count.index].id
  }

  tags = {
    Name = "NAT Gateway Route Table ${count.index + 1}"
  }
}

# Outbound Internet traffic from private subnets will pass through the NAT Gateway
resource "aws_route_table_association" "nat_assoc" {
  count = length(var.app_subnet_cidrs)
  subnet_id = aws_subnet.app_server_subnet[count.index].id
  route_table_id = aws_route_table.nat_route[count.index].id
}