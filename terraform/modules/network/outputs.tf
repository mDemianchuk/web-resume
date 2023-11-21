output "cloudfront_distribution_id" {
  description = "CloudFront Distribution ID"
  value       = aws_cloudfront_distribution.web_app.id
}

output "cloudfront_oai_arn" {
  description = "IAM Arn of CloudFront Origin Access Identity"
  value       = aws_cloudfront_origin_access_identity.oai.iam_arn
}

output "website_url" {
  description = "The base URL of the web app"
  value       = local.has_custom_domain ? local.app_domain_name : aws_cloudfront_distribution.web_app.domain_name
}
