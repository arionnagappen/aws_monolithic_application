resource "aws_cloudwatch_metric_alarm" "rds_low_storage" {
  alarm_name = "RDSLowStorage"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = 1
  metric_name = "FreeStorageSpace"
  namespace = "AWS/RDS"
  period = 300
  statistic = "Average"
  threshold = var.rds_storage_threshold
  alarm_description = "Triggers if RDS free storage drops below ${var.rds_storage_threshold}"
  dimensions = {
    DBInstanceIdentifier = var.db_rds_id
  }
  treat_missing_data = "notBreaching"
  alarm_actions = [
    var.sns_topic_arn
    ]
}