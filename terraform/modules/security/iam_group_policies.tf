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

// --- ANALYST POLICY --- Read only s3 access, Read-only rds
resource "aws_iam_policy" "analyst_policy" {
  name        = "AnalystPolicy"
  description = "Policy for Analyst Group"

  policy = jsonencode({
    "Version" : "2012-10-17"
    "Statement" : [

      # S3 Read-Only
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:Get*",
          "s3:List*",
          "s3:Describe*",
          "s3-object-lambda:Get*",
          "s3-object-lambda:List*"
        ],
        "Resource" : "*"
      },

      # RDS Read-Only
      {
        "Effect" : "Allow",
        "Action" : [
          "rds:Describe*",
          "rds:ListTagsForResource",
          "ec2:DescribeAccountAttributes",
          "ec2:DescribeAvailabilityZones",
          "ec2:DescribeInternetGateways",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSubnets",
          "ec2:DescribeVpcAttribute",
          "ec2:DescribeVpcs"
        ],
        "Resource" : "*"
      }
    ]
  })
}
