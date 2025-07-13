// --- SUBNET GROUP FOR RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name = var.db_subnet_group_name
  subnet_ids = var.database_subnet_ids

  tags = {
    Name = var.db_subnet_group_tag
  }
}