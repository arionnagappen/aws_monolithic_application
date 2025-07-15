resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name = "HighEC2CPU"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = 5
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = 60
  statistic = "Average"
  threshold = var.cpu_threshold
  alarm_description = "EC2 CPU over 70% for 5 minutes"
  dimensions = {
    InstanceId = var.app_server_ids
  }
  alarm_actions = [var.sns_topic_arn]
}