variable "domain_name" {
  type        = string
  description = "Domain name for the web app"
}

variable "subdomain_name" {
  type        = string
  description = "Subdomain name for the web app (only applicable when domain_name is set)"
}

variable "source_bucket_name" {
  type        = string
  description = "S3 Bucket name for the web app build artifacts"
}

variable "source_bucket_prefix" {
  type        = string
  description = "S3 Bucket prefix that corresponds the base URL for the web app"
}

variable "source_bucket_regional_domain_name" {
  type        = string
  description = "Regional domain name of the source S3 Bucket"
}
