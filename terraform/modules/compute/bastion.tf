// ---BASTION HOST
resource "aws_instance" "bastion_host" {
  ami = var.bastion_inst_ami
  instance_type = var.bastion_inst_type
  subnet_id = element(var.public_subnet_ids, 0)
  key_name = aws_key_pair.bastion_key.key_name
  security_groups = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = var.bastion_tag
  }
}

// ---BASTION HOST KEY-PAIR
resource "aws_key_pair" "bastion_key" {
  key_name = "bastion"
  public_key = file("~/.ssh/bastion-key.pub")
}