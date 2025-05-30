// --- SUBNET GROUP FOR RDS
resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "rds-private-subnet-group"
  subnet_ids = var.database_subnet_ids

  tags = {
    Name = "RDS subnet group"
  }
}

// --- RDS INSTANCE ---
resource "aws_db_instance" "my_db" {
  identifier = var.db_identifier
  engine = var.db_engine
  engine_version = var.db_eng_version
  instance_class = var.db_inst_class
  username = local.rds_creds.username
  password = local.rds_creds.password
  allocated_storage = var.db_storage_size
  skip_final_snapshot = true
  publicly_accessible = false
  multi_az = true

  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  
  storage_encrypted = true
  kms_key_id = var.kms_key_id
}