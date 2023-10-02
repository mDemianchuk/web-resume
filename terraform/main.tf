module "s3" {
  source = "./modules/s3"

  source_bucket_name = var.source_bucket_name
  log_bucket_name    = var.log_bucket_name
}

module "cloudfront" {
  source = "./modules/cloudfront"

  domain_name        = module.s3.bucket_domain_name
  source_bucket_name = var.source_bucket_name
  log_bucket_name    = var.log_bucket_name
}