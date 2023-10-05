locals {
  caching_disabled_policy_id = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
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
  default_root_object = "${var.source_s3_prefix}/index.html"
  default_cache_behavior {
    cache_policy_id        = local.caching_disabled_policy_id
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = aws_s3_bucket.web_resume_app.id
    viewer_protocol_policy = "redirect-to-https"
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
