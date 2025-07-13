resource "aws_s3_bucket" "user_data_bucket" {
  bucket = var.user_data_bucket_name
}

resource "aws_s3_bucket_server_side_encryption_configuration" "user_data_encryption" {
  bucket = aws_s3_bucket.user_data_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
      kms_master_key_id = var.kms_key_arn
    }
  }
}

resource "aws_s3_bucket_public_access_block" "user_data_block" {
  bucket = aws_s3_bucket.user_data_bucket.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}