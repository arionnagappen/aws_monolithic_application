// --- APP SERVER SECURITY GROUP ---
resource "aws_security_group" "app_server_sg" {
  name = "app-server-sg"
  description = "App server security group"
  vpc_id = var.vpc_id

  ingress {
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  security_groups = [aws_security_group.alb_sg.id]  # Allow from ALB
  }

  ingress {
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  security_groups = [aws_security_group.bastion_sg.id]
  description     = "Allow SSH from Bastion"
  }

  ingress {
  from_port       = -1
  to_port         = -1
  protocol        = "icmp"
  security_groups = [aws_security_group.bastion_sg.id] # Ping from Bastion
  }


  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }
}