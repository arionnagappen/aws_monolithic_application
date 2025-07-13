# Allow Public Access to the Bucket
resource "aws_s3_bucket_public_access_block" "frontend_bucket_public_access_block" {
  bucket = aws_s3_bucket.frontend_bucket.id

  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
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