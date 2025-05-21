// --- APP SERVER INSTANCE
resource "aws_instance" "app_server_instance" {
  ami = var.inst_ami
  instance_type = var.inst_type
  count = length(var.app_subnet_ids)

  subnet_id = element(var.app_subnet_ids, count.index)
  key_name = aws_key_pair.bastion_app_server_key.key_name


  tags = {
    Name = "App Server ${count.index + 1}"
  }
}

// --- APP SERVER INSTANCE KEY-PAIR
resource "aws_key_pair" "bastion_app_server_key" {
  key_name = "app-server-key"
  public_key = file("~/.ssh/app-server-key.pub")
}