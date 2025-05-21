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