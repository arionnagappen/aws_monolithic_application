// --- DEVELOPER POLICY ---
resource "aws_iam_policy" "developer_policy" {
  name        = "DeveloperGroupPolicy"
  description = "Policy for Developer Group"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [

      # EC2 Management
      {
        "Effect" : "Allow",
        "Action" : "ec2:*",
        "Resource" : "*"
      },

      # Read and Write to S3
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ],
        "Resource" : "arn:aws:s3:::s3-frontend-bucket-an"
      },

      # View CloudWatch Logs
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
          "logs:GetLogEvents",
          "logs:FilterLogEvents"
        ],
        "Resource" : "*"
      }
    ]
  })
}