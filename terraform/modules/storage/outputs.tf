output "source_bucket_regional_domain_name" {
  description = "Regional domain name of the source S3 Bucket"
  value       = aws_s3_bucket.source_bucket.bucket_regional_domain_name
}