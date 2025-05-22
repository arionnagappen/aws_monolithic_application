// --- APP SERVER SECURITY GROUP ---
resource "aws_security_group" "app_server_sg" {
  name = "app-server-sg"
  description = "App server security group"
  vpc_id = var.vpc_id
}