// --- FINANCE POLICY --- Cost Explorer, AWS Budgets, Read-Only Resource Access
resource "aws_iam_policy" "finance_policy" {
  name        = "FinanceGroupPolicy"
  description = "Policy for Finance Group"

  policy = jsonencode({
    "Version" : "2012-10-17"
    "Statement" : [

      # Cost Explorer
      {
        "Effect" : "Allow",
        "Action" : "ce:*",
        "Resource" : "*"
      },

      # AWS Budgets
      {
        "Effect" : "Allow",
        "Action" : [
          "aws-portal:ViewBilling",
          "budgets:ViewBudget",
          "budgets:Describe*",
          "budgets:ListTagsForResource"
        ],
        "Resource" : "*"
      }
    ]
  })
}