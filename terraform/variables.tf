variable "region" {
  type        = string
  description = "Target AWS Region"
  default     = "us-east-1"
}

variable "deployment_role_arn" {
  type        = string
  description = "IAM Role Arn used to deploy the Terraform infrastructure"
}

variable "domain_name" {
  type        = string
  description = "Domain name for the web app"
  default     = ""
}

variable "email_subscribers" {
  type        = set(string)
  description = "A list of emails to notify about CloudFront errors"
  default     = []
}

variable "subdomain_name" {
  type        = string
  description = "Subdomain name for the web app (only applicable when domain_name is set)"
  default     = "resume"
}

variable "source_bucket_name" {
  type        = string
  description = "S3 Bucket name for the web app build artifacts"
}

variable "source_bucket_prefix" {
  type        = string
  description = "S3 Bucket prefix that corresponds the base URL for the web app"
  default     = "web-resume"
}

variable "source_path" {
  type        = string
  description = "Source path to the build artifacts, relative to the root module"
  default     = "dist"
}
