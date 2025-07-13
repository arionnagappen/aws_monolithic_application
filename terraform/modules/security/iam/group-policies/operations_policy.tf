// --- OPERATIONS POLICY ---
resource "aws_iam_policy" "operations_policy" {
  name        = "OperationsGroupPolicy"
  description = "Policy for Operations Group"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [

      # Full EC2 Access
      {
        "Effect" : "Allow",
        "Action" : "ec2:*",
        "Resource" : "*"
      },

      # Full CloudWatch Access
      {
        "Effect" : "Allow",
        "Action" : "cloudwatch:*",
        "Resource" : "*"
      },

      # Systems Manager
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:*",
          "ssm:*",
          "ec2messages:*"
        ],
        "Resource" : "*"
      },

      # RDS Management
      {
        "Effect" : "Allow",
        "Action" : "rds:*",
        "Resource" : "*"
      }
    ]
  })
}