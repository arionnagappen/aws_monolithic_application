output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "availability_zones" {
  value = var.availability_zones
}

output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public_subnets : subnet.id]
}

output "app_subnet_ids" {
  value = [for subnet in aws_subnet.app_server_subnet : subnet.id]
}

output "database_subnet_ids" {
  value = [for subnet in aws_subnet.database_subnet : subnet.id]
}

output "nat_ids" {
  value = [for nat in aws_nat_gateway.nat_gw : nat.id]
}

