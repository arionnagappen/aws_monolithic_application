// --- DEVELOPERS ---
resource "aws_iam_group" "developers_group" {
  name = "DeveloperSecurityGroup"
}

resource "aws_iam_group_policy_attachment" "developers_policy_attach" {
  group      = aws_iam_group.developers_group.name
  policy_arn = aws_iam_policy.developer_policy.arn
}

// --- OPERATIONS ---
resource "aws_iam_group" "operations_group" {
  name = "OperationsSecurityGroup"
}

resource "aws_iam_group_policy_attachment" "operations_policy_attach" {
  group      = aws_iam_group.operations_group.name
  policy_arn = aws_iam_policy.operations_policy.arn
}

// --- FINANCE ---
resource "aws_iam_group" "finance_group" {
  name = "FinanceGroup"
}

resource "aws_iam_group_policy_attachment" "name" {
  group = aws_iam_group.finance_group.name
  policy_arn = aws_iam_policy.finance_policy.arn
}