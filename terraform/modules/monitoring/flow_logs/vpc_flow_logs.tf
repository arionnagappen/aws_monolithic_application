// CloudWatch Log Group stores flow log entries
resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name = "/vpc/flow-logs"
  retention_in_days = 1
}

// Create Flow Log Resource
resource "aws_flow_log" "vpc_logs" {
  log_destination = aws_cloudwatch_log_group.vpc_flow_logs.arn
  log_destination_type = "cloud-watch-logs"
  traffic_type = "REJECT"
  vpc_id = var.vpc_id

  iam_role_arn = aws_iam_role.vpc_flow_logs_role.arn
}