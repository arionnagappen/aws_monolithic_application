module "my_kms" {
  source = "./kms"
}

module "iam" {
  source = "./iam"
  user_data_arn = var.user_data_arn
}

module "group_policies" {
  source = "./iam/group-policies"
}

module "role_policies" {
  source = "./iam/role-policies"
  user_data_arn = var.user_data_arn
  iam_role_id = module.iam.iam_role_id
}

module "db_secrets" {
  source = "./secrets-manager"
  rds_secret_name = var.rds_secrets_name
}

