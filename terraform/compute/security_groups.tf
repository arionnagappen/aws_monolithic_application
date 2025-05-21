// --- APP SERVER SECURITY GROUP ---
resource "aws_security_group" "app_server_sg" {
  name = "app-server-sg"
  description = "App server security group"
  vpc_id = var.vpc_id
}

// --- ALB SECURITY GROUP
resource "aws_security_group" "alb_sg" {
  name = "alb-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}