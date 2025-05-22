// --- DEVELOPER POLICY ---
resource "aws_iam_policy" "developer_policy" {
  name = "DeveloperGroupPolicy"
  description = "Managed policy for Developer Group"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [

      # EC2 Managment
      {
        "Effect": "Allow",
        "Action": "ec2:*",
        "Resource": "*"
      },

      # Read & Write to S3
      {
        "Effect": "Allow",
			  "Action": [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
			],
			  "Resource": "arn:aws:s3:::s3-frontend-bucket-an"
      },

      # View CloudWatch Logs
      {
        "Effect": "Allow",
        "Action": [
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
          "logs:GetLogEvents",
          "logs:FilterLogEvents"
        ],
        "Resource": "*"
      }
    ]
  })
}

// --- OPERATIONS POLICY ---

// --- FINANCE POLICY ---

// --- ANALYST POLICY ---
