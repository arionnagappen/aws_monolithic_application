output "app_server_ids" {
  value = aws_autoscaling_group.app_server_asg.id
}

output "app_server_sg_id" {
  value = aws_security_group.app_server_sg.id
}

output "asg_name" {
  value = aws_autoscaling_group.app_server_asg.name
}

output "asg_policy_arn" {
  value = aws_autoscaling_policy.scale_out.arn
}