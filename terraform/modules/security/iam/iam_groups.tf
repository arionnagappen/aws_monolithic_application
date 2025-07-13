// --- DEVELOPERS ---
resource "aws_iam_group" "developers_group" {
  name = "DeveloperSecurityGroup"
}

# Attach Developer Policy
resource "aws_iam_group_policy_attachment" "developers_policy_attach" {
  group      = aws_iam_group.developers_group.name
  policy_arn = aws_iam_policy.developer_policy.arn
}

// --- OPERATIONS ---
resource "aws_iam_group" "operations_group" {
  name = "OperationsSecurityGroup"
}

# Attach Operations Policy
resource "aws_iam_group_policy_attachment" "operations_policy_attach" {
  group      = aws_iam_group.operations_group.name
  policy_arn = aws_iam_policy.operations_policy.arn
}

// --- FINANCE ---
resource "aws_iam_group" "finance_group" {
  name = "FinanceGroup"
}

# Attach Finance Policy
resource "aws_iam_group_policy_attachment" "name" {
  group      = aws_iam_group.finance_group.name
  policy_arn = aws_iam_policy.finance_policy.arn
}

// --- ANALYSTS ---
resource "aws_iam_group" "analyst_group" {
  name = "AnalystGroup"
}

# Attach Analysts Policy
resource "aws_iam_group_policy_attachment" "analyst_policy_attach" {
  group      = aws_iam_group.analyst_group.name
  policy_arn = aws_iam_policy.analyst_policy.arn
}