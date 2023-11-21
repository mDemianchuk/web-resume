variable "region" {
  type        = string
  description = "Target AWS Region"
  default     = "us-east-1"
}

variable "deployment_role_arn" {
  type        = string
  description = "IAM Role ARN used to deploy the Terraform infrastructure"
}

variable "domain_name" {
  type        = string
  description = "Optional domain name for the web app"
  default     = ""
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

variable "source_s3_prefix" {
  type        = string
  description = "S3 Bucket prefix that corresponds the base URL for the web app"
  default     = "web-resume"
}

variable "source_path" {
  type        = string
  description = "Source path to the build artifacts, relative to the root module"
  default     = "dist"
}

variable "file_types" {
  type        = map(string)
  description = "Mapping of file types to their respective content types"
  default = {
    js   = "text/javascript"
    css  = "text/css"
    map  = "application/json"
    html = "text/html"
    ico  = "image/x-icon"
  }
}
