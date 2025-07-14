output "app_server_instance_profile_name" {
  value = aws_iam_instance_profile.app_instance_profile.name
}

// --- GROUP POLICIES ---
output "dev_policy_arn" {
  value = module.group_policies.dev_policy_arn
}

output "operations_policy_arn" {
  value = module.group_policies.operations_policy_arn
}

output "finance_policy_arn" {
  value = module.group_policies.finance_policy_arn
}

output "analyst_policy_arn" {
  value = module.group_policies.analyst_policy_arn
}

// --- IAM ROLE --- 
output "iam_role_id" {
  value = aws_iam_role.app_server_role.id
}