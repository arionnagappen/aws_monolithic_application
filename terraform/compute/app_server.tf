// --- APP SERVER LAUNCH TEMPLATE ---
resource "aws_launch_template" "app_server_template" {
  name_prefix            = "app-server-"
  image_id               = var.inst_ami
  instance_type          = var.inst_type
  key_name               = aws_key_pair.bastion_app_server_key.key_name
  vpc_security_group_ids = [aws_security_group.app_server_sg.id]
  iam_instance_profile {
    name = var.app_server_instance_profile_name
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "App Server"
    }
  }
}

// --- APP SERVER AUTO-SCALING GROUP ---
resource "aws_autoscaling_group" "app_server_asg" {
  name                = "app-server-asg"
  max_size            = 3
  min_size            = 1
  desired_capacity    = 2
  vpc_zone_identifier = var.app_subnet_ids
  launch_template {
    id      = aws_launch_template.app_server_template.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.app_server_tg.arn]

  tag {
    key                 = "Name"
    value               = "App Server"
    propagate_at_launch = true
  }


  health_check_type         = "ELB"
  health_check_grace_period = 300
  force_delete              = true

  lifecycle {
    create_before_destroy = true
  }
}

// --- APP SERVER INSTANCE KEY-PAIR ---
resource "aws_key_pair" "bastion_app_server_key" {
  key_name   = "app-server-key"
  public_key = file("~/.ssh/app-server-key.pub")
}