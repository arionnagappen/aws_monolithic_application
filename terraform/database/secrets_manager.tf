// --- SECRETS MANAGER ---
data "aws_secretsmanager_secret" "rds-creds" {
  name = var.secret_name
}

data "aws_secretsmanager_secret_version" "rds_version" {
  secret_id = data.aws_secretsmanager_secret.rds-creds.id
}

locals {
  rds_creds = jsondecode(data.aws_secretsmanager_secret_version.rds_version.secret_string)
}