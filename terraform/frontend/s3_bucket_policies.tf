# Allow public traffic to only read the objects in the bucket
resource "aws_s3_bucket_policy" "frontend_bucket_policy" {
  bucket = aws_s3_bucket.frontend_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "PublicReadGetObject",
        Effect = "Allow",
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
        }
        Action = "s3:GetObject",
        Resource = "${aws_s3_bucket.frontend_bucket.arn}/*"
      }
    ]
  })
}