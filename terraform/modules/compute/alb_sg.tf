// --- ALB SECURITY GROUP
resource "aws_security_group" "alb_sg" {
  name = "alb-sg"
  vpc_id = var.vpc_id

  # Accept inbound traffic from the internet directed to port 80
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allows ALB to repsond to all outbound traffic
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}