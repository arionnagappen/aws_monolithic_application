output "sns_topic_arn" {
  value = aws_sns_topic.ec2_alerts.arn
}