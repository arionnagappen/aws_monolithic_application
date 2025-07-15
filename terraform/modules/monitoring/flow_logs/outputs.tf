output "log_group_arn" {
  value = aws_cloudwatch_log_group.vpc_flow_logs.arn
}