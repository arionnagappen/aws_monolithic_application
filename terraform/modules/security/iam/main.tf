module "role_policies" {
  source = "./role-policies"
  user_data_arn = module.storage.user_data_arn
}

module "group_policies" {
  source = "./group-policies"
}