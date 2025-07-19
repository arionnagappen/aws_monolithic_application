resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name = "HighCPU-ASG"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = 1
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = 300
  statistic = "Average"
  threshold = var.cpu_threshold
  alarm_description = "Average ASG CPU usage over ${var.cpu_threshold}% for 5 minutes"
  dimensions = {
    AutoScalingGroupName = var.asg_name
  }
  treat_missing_data = "notBreaching"
  alarm_actions = [
    var.sns_topic_arn,
    var.asg_policy_arn
    ]
}