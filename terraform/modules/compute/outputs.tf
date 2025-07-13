output "app_server_ids" {
  value = aws_autoscaling_group.app_server_asg.id
}

output "app_server_sg_id" {
  value = aws_security_group.app_server_sg.id
}