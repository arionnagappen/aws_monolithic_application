// --- CLOUDFRONT ---
# Origin Access Identity - Only CloudFront can access the S3 bucket
resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "OAI for Frontend Site"
}

# CloudFront Distribution
resource "aws_cloudfront_distribution" "s3_frontend_distribution" {

  origin {
    domain_name = aws_s3_bucket.frontend_bucket.bucket_regional_domain_name
    origin_id = "S3-frontend-bucket"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  enabled = true # Activate CloudFront Distribution to serve content
  is_ipv6_enabled = true # Enables IPv6 support
  comment = "Frontend site"
  default_root_object = "index.html" # File to be served

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD", "OPTIONS"] # HTTP methods allowed for caching behaviour
    cached_methods = ["GET", "HEAD"] # Methods to be cached
    target_origin_id = "S3-frontend-bucket" # Links cache behaviour to the origin

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }

    }

    viewer_protocol_policy = "redirect-to-https" # Ensures secure connection between CDN & Client
    min_ttl = 0 # Min. amount of time an object is cached
    default_ttl = 3600 # Default amount of time an object is cached
    max_ttl = 86400 # Max. amount of time an object is cached
  }

  restrictions {
    geo_restriction {
      restriction_type = "none" # All geographic locations are allowed
    }
  }

  viewer_certificate {
    # Configure SSL and TSL settings
    cloudfront_default_certificate = true
  }

}