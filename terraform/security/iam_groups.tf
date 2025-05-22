// --- DEVELOPERS ---
resource "aws_iam_group" "developers_group" {
  name = "DeveloperSecurityGroup"
}

resource "aws_iam_group_policy_attachment" "developers_policy_attach" {
  group = aws_iam_group.developers_group.name
  policy_arn = aws_iam_policy.developer_policy.arn
}