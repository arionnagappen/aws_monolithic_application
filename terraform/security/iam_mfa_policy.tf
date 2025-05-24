# Creates MFA Policy
resource "aws_iam_policy" "enforce_mfa" {
  name = "EnforceMFA"
  description = "Deny all access unless MFA is used"

  policy = jsonencode({
    "Version": "2012-10-17"
    "Statement": [
      {
        "Effect": "Deny",
        "Action": "*",
        "Resource": "*",
        "Condition": {
          "BoolIfExists": {
            "aws:MultiFactorAuthPresent": "false"
          }
        }
      }
    ]
  })
}

# Attach to groups
resource "aws_iam_group_policy_attachment" "mfa_attachment" {
  for_each = toset(["developers_group", "operations_group", "finance_group", "analyst_group"])

  group = each.key
  policy_arn = aws_iam_policy.enforce_mfa.arn
}