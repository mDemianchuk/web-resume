variable "region" {
  type        = string
  description = "Target AWS Region"
  default     = "us-east-1"
}

variable "deployment_role_arn" {
  description = "IAM Role ARN used to deploy the Terraform infrastructure"
  type        = string
}

variable "domain_name" {
  description = "Optional domain name for the web app"
  type        = string
  default     = ""
}

variable "subdomain_name" {
  description = "Subdomain name for the web app (only applicable when domain_name is set)"
  type        = string
  default     = "resume"
}

variable "source_bucket_name" {
  description = "S3 Bucket name for the web app build artifacts"
  type        = string
}

variable "source_s3_prefix" {
  description = "S3 Bucket prefix that corresponds the base URL for the web app"
  type        = string
  default     = "web-resume"
}

variable "file_types" {
  description = "Mapping of file types to their respective content types"
  type        = map(string)
  default = {
    js   = "text/javascript"
    css  = "text/css"
    map  = "application/json"
    html = "text/html"
    ico  = "image/x-icon"
  }
}
