output "db_rds_id" {
  value = aws_db_instance.my_db.id
}

output "db_subnet_group_id" {
  value = aws_db_subnet_group.rds_subnet_group.id
}