resource "aws_cloudwatch_metric_alarm" "rds_low_storage" {
  alarm_name = "RDSLowStorage"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = 5
  metric_name = "FreeStorageSpace"
  namespace = "AWS/RDS"
  period = 60
  statistic = "Average"
  threshold = var.rds_storage_threshold
  alarm_description = "Triggers if RDS free storage drops below threshold"
  dimensions = {
    DBInstanceIdentifier = var.db_rds_id
  }
  alarm_actions = [var.sns_topic_arn]
}