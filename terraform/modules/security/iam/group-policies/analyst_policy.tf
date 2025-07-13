// --- ANALYST POLICY ---
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
