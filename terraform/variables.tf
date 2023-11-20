variable "region" {
  type    = string
  default = "us-east-1"
}

variable "deployment_role_arn" {
  type = string
}

variable "domain_name" {
  type    = string
  default = ""
}

variable "subdomain_name" {
  type    = string
  default = "resume"
}

variable "source_bucket_name" {
  type = string
}

variable "source_s3_prefix" {
  type    = string
  default = "web-resume"
}

variable "file_types" {
  description = "Mapping of file types to their respective content types"
  type        = map(string)
  default     = {
    js  = "text/javascript"
    css = "text/css"
    map = "application/json"
    html = "text/html"
    ico = "image/x-icon"
  }
}
