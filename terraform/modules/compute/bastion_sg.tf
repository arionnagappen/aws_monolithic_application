// BASTION SECURITY GROUP
resource "aws_security_group" "bastion_sg" {
  name = "bastion-sg"
  description = "Bastion Security Group"
  vpc_id = var.vpc_id
}

// BASTION SSH RULE
resource "aws_security_group_rule" "only_allow_ssh" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["102.223.57.13/32"]
  security_group_id = aws_security_group.bastion_sg.id
}