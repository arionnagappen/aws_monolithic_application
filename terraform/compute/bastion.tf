// ---BASTION HOST
resource "aws_instance" "bastion_host" {
  ami = var.inst_ami
  instance_type = var.inst_type
  subnet_id = element(var.public_subnet_ids, 0)
  key_name = aws_key_pair.bastion_key.key_name


  tags = {
    Name = "Bastion Host"
  }
}

// ---BASTION HOST KEY-PAIR
resource "aws_key_pair" "bastion_key" {
  key_name = "bastion"
  public_key = file("~/.ssh/bastion-key.pub")
}