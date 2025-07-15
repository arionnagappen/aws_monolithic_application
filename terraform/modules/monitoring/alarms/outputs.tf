output "cpu_threshold" {
  value = aws_cloudwatch_metric_alarm.high_cpu.threshold
}

output "rds_storage_threshold" {
  value = aws_cloudwatch_metric_alarm.rds_low_storage.threshold
}