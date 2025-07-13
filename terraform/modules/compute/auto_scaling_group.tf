// --- APP SERVER AUTO-SCALING GROUP ---
resource "aws_autoscaling_group" "app_server_asg" {
  name                = var.asg_name
  max_size            = var.maximum_size
  min_size            = var.minimum_size
  desired_capacity    = var.desired_cap
  vpc_zone_identifier = var.app_subnet_ids
  launch_template {
    id      = aws_launch_template.app_server_template.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.app_server_tg.arn]

  tag {
    key                 = "Name"
    value               = var.asg_tag
    propagate_at_launch = true
  }


  health_check_type         = var.health_chk_type
  health_check_grace_period = var.health_chk_grace_period
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