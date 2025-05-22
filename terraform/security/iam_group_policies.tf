// --- DEVELOPER POLICY ---
resource "aws_iam_policy" "developer_policy" {
  name = "DeveloperGroupPolicy"
  description = "Managed policy for Developer Group"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "ec2:*",
        "Resource": "*"
      },

      {
        "Effect": "Allow",
			  "Action": [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
			],
			  "Resource": "arn:aws:s3:::s3-frontend-bucket-an"
      },

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
