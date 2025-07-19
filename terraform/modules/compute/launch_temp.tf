// --- APP SERVER LAUNCH TEMPLATE ---
resource "aws_launch_template" "app_server_template" {
  name_prefix            = var.name_prefix
  image_id               = var.inst_ami
  instance_type          = var.inst_type
  key_name               = aws_key_pair.bastion_app_server_key.key_name
  vpc_security_group_ids = [aws_security_group.app_server_sg.id]
  iam_instance_profile {
    name = var.app_server_instance_profile_name
  }

  monitoring {
    enabled = true
  }

  user_data = base64encode(file("${path.module}/run_nginx.sh"))

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.launch_temp_tag
    }
  }
}

