// --- S3 BUCKET ----
# Creates S3 Bucket
resource "aws_s3_bucket" "frontend_bucket" {
  bucket = var.frontend_bucket_name
}

# Ownership control of the S3 bucket
resource "aws_s3_bucket_ownership_controls" "frontend_bucket_ownership_controls" {
  bucket = aws_s3_bucket.frontend_bucket.id

  rule {
    # Only Owner of the bucket has complete control over all objects in the bucket
    object_ownership = var.bucket_object_ownership
  }
}