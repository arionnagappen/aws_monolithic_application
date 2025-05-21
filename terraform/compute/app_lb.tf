// --- ALB TARGET GROUP
resource "aws_lb_target_group" "app_server_tg" {
  name = "app-server-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id

  health_check {
    path = "/"
    interval = 30
    timeout = 5
    healthy_threshold = 5
    unhealthy_threshold = 2
    matcher = 200
  }
}
// --- APPLICATION LOAD BALANCER ---
resource "aws_lb" "app_server_lb" {
  name = "app-server-lb"
  load_balancer_type = "application"
  subnets = var.public_subnet_ids
  security_groups = [aws_security_group.alb_sg.id]

  enable_deletion_protection = false
}

// --- ALB LISTENER
resource "aws_lb_listener" "app_server_listener" {
  load_balancer_arn = aws_lb.app_server_lb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app_server_tg.arn
  }
}
// --- ALB REGISTER TARGETS (ALB GROUP ATTACHMENT)
resource "aws_lb_target_group_attachment" "app_server_attachment" {
  target_group_arn = aws_lb_target_group.app_server_tg.arn
  count = length(aws_instance.app_server_instance)
  target_id = aws_instance.app_server_instance[count.index].id
  port = 80
}