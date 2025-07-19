module "vpc_flow_logs" {
  source = "./flow_logs"
  vpc_id = var.vpc_id
}

module "sns" {
  source = "./sns"
  alert_email = var.alert_email
}

module "app_server_alarms" {
  source = "./alarms"

  // SNS
  sns_topic_arn = module.sns.sns_topic_arn

  // App Servers
  app_server_ids = var.app_server_ids
  cpu_threshold = var.cpu_threshold

  // Database Instances
  db_rds_id = var.db_rds_id
  rds_storage_threshold = var.rds_storage_threshold

  // ASG Name
  asg_name = var.asg_name
  asg_policy_arn = var.asg_policy_arn
}