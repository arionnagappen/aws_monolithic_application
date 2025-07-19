// BASTION SECURITY GROUP
resource "aws_security_group" "bastion_sg" {
  name = "bastion-sg"
  description = "Bastion Security Group"
  vpc_id = var.vpc_id
}

// BASTION INGRESS SSH RULE
resource "aws_security_group_rule" "only_allow_ssh" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["102.223.57.36/32"]
  security_group_id = aws_security_group.bastion_sg.id
}

// BASTION EGRESS SSH RULE
resource "aws_security_group_rule" "bastion_tcp_egress" {
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/16"] # or the app subnet range
  security_group_id = aws_security_group.bastion_sg.id
}

// ALLOW PING
resource "aws_security_group_rule" "bastion_icmp_egress" {
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["10.0.0.0/16"]
  security_group_id = aws_security_group.bastion_sg.id
}
