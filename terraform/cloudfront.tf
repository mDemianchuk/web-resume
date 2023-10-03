locals {
  one_hour_in_seconds = 60 * 60
  one_day_in_seconds  = local.one_hour_in_seconds * 24
}

resource "aws_cloudfront_origin_access_identity" "web_resume_app" {
  comment = var.source_bucket_name
}

resource "aws_cloudfront_distribution" "web_resume_app" {
  origin {
    domain_name = aws_s3_bucket.web_resume_app.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.web_resume_app.id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.web_resume_app.cloudfront_access_identity_path
    }
  }
  enabled             = true
  default_root_object = "index.html"
  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.web_resume_app.id
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = local.one_hour_in_seconds
    max_ttl                = local.one_day_in_seconds
  }
  price_class = "PriceClass_100"
  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US"]
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }
  depends_on = [aws_s3_bucket.web_resume_app]
}
