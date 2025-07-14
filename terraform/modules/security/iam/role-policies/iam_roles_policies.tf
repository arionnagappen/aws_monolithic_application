// --- ONLY ALLOW ALLOW APP SERVER TO ACCESS USER DATA ---
resource "aws_iam_role_policy" "app_server_role_policy" {
  name = "allow-s3-access"
  role = var.iam_role_id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = ["s3:GetObject", "s3:PutObject"],
      Resource = "${var.user_data_arn}/*"
     }
    ]
  })
}