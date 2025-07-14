// --- DEVELOPERS ---
resource "aws_iam_group" "developers_group" {
  name = "DeveloperSecurityGroup"
}

# Attach Developer Policy
resource "aws_iam_group_policy_attachment" "developers_policy_attach" {
  group      = aws_iam_group.developers_group.name
  policy_arn = module.group_policies.dev_policy_arn
}

// --- OPERATIONS ---
resource "aws_iam_group" "operations_group" {
  name = "OperationsSecurityGroup"
}

# Attach Operations Policy
resource "aws_iam_group_policy_attachment" "operations_policy_attach" {
  group      = aws_iam_group.operations_group.name
  policy_arn = module.group_policies.operations_policy_arn
}

// --- FINANCE ---
resource "aws_iam_group" "finance_group" {
  name = "FinanceGroup"
}

# Attach Finance Policy
resource "aws_iam_group_policy_attachment" "name" {
  group      = aws_iam_group.finance_group.name
  policy_arn = module.group_policies.finance_policy_arn
}

// --- ANALYSTS ---
resource "aws_iam_group" "analyst_group" {
  name = "AnalystGroup"
}

# Attach Analysts Policy
resource "aws_iam_group_policy_attachment" "analyst_policy_attach" {
  group      = aws_iam_group.analyst_group.name
  policy_arn = module.group_policies.analyst_policy_arn
}