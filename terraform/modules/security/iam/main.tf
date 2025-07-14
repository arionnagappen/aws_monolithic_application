module "role_policies" {
  source = "./role-policies"
  user_data_arn = var.user_data_arn
  iam_role_id = aws_iam_role.app_server_role.id
}

module "group_policies" {
  source = "./group-policies"
}

