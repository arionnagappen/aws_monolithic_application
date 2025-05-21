// --- RDS SECURITY GROUP ---
resource "aws_security_group" "rds_sg" {
  name = "rds-db-sg"
  description = "Only allow traffic from app servers"
  vpc_id = var.vpc_id
}

// --- ALLOW TRAFFIC FROM APP SERVERS TO RDS 
resource "aws_security_group_rule" "allow_app_to_rds_traffic" {
  type = "ingress"
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  security_group_id = aws_security_group.rds_sg.id
  source_security_group_id = var.app_server_sg_id
}

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
  identifier = "my-app-db"
  engine = "mysql"
  engine_version = "8.0.41"
  instance_class = "db.t3.micro"
  username = local.rds_creds.username
  password = local.rds_creds.password
  allocated_storage = 10
  skip_final_snapshot = true
  publicly_accessible = false
  multi_az = true

  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}