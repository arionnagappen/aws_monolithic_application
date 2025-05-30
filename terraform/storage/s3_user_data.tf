resource "aws_s3_bucket" "user_data_bucket" {
  bucket = "s3-user-data-bucket"

}

resource "aws_s3_bucket_server_side_encryption_configuration" "user_data_encryption" {
  bucket = aws_s3_bucket.user_data_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
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