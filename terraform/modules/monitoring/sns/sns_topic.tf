resource "aws_sns_topic" "cloud_infra_alerts" {
  name = "cloud_infra_alerts"
}

resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.cloud_infra_alerts.arn
  protocol = "email"
  endpoint = var.alert_email
}