output "dev_policy_arn" {
  value = aws_iam_policy.developer_policy.arn
}

output "operations_policy_arn" {
  value = aws_iam_policy.operations_policy.arn
}

output "finance_policy_arn" {
  value = aws_iam_policy.finance_policy.arn
}

output "analyst_policy_arn" {
  value = aws_iam_policy.analyst_policy.arn
}