resource "aws_sns_topic" "ec2_alerts" {
  name = "ec2-cpu-alerts"
}

resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.ec2_alerts.arn
  protocol = "email"
  endpoint = var.alert_email
}