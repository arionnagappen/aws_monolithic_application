# Allow Public Access to the Bucket
resource "aws_s3_bucket_public_access_block" "frontend_bucket_public_access_block" {
  bucket = aws_s3_bucket.frontend_bucket.id

  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

# Sets the bucket ACL to allow everyone to read its objects
resource "aws_s3_bucket_acl" "frontend_bucket_acl" {
  depends_on = [ 
    aws_s3_bucket_ownership_controls.frontend_bucket_ownership_controls,
    aws_s3_bucket_public_access_block.frontend_bucket_public_access_block
   ]

  bucket = aws_s3_bucket.frontend_bucket.id
  acl = "public-read"
}