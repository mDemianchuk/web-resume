locals {
  # https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/using-managed-cache-policies.html#managed-cache-policy-caching-disabled
  caching_disabled_policy_id = "4135ea2d-6df8-44a3-9df3-4b5a84be39ad"
  app_domain_name            = "${var.subdomain_name}.${var.domain_name}"
  has_custom_domain          = var.domain_name != ""
  domain_validation_options  = local.has_custom_domain ? aws_acm_certificate.cert[0].domain_validation_options : []
}

data "aws_route53_zone" "web_resume_app" {
  count = local.has_custom_domain ? 1 : 0

  name         = var.domain_name
  private_zone = false
}

resource "aws_acm_certificate" "cert" {
  provider = aws.us_east_1
  count    = local.has_custom_domain ? 1 : 0

  domain_name       = local.app_domain_name
  validation_method = "DNS"
}

resource "aws_route53_record" "cert_cname" {
  for_each = {
    for option in local.domain_validation_options : option.domain_name => {
      name   = option.resource_record_name
      record = option.resource_record_value
      type   = option.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.web_resume_app[0].zone_id
}

resource "aws_acm_certificate_validation" "cert_validation" {
  provider = aws.us_east_1
  count    = local.has_custom_domain ? 1 : 0

  certificate_arn = aws_acm_certificate.cert[0].arn
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
  aliases             = local.has_custom_domain ? [local.app_domain_name] : []
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
      restriction_type = "none"
      locations        = []
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = local.has_custom_domain ? false : true
    acm_certificate_arn            = local.has_custom_domain ? aws_acm_certificate_validation.cert_validation[0].certificate_arn : null
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
  depends_on = [aws_s3_bucket.web_resume_app]
}

resource "aws_route53_record" "cloudfront_cname" {
  count = var.domain_name != "" ? 1 : 0

  name    = local.app_domain_name
  records = [aws_cloudfront_distribution.web_resume_app.domain_name]
  type    = "CNAME"
  ttl     = 60
  zone_id = data.aws_route53_zone.web_resume_app[0].zone_id
}

output "website_url" {
  value = local.has_custom_domain ? local.app_domain_name : aws_cloudfront_distribution.web_resume_app.domain_name
}
