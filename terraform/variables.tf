variable "app_domain_name" {
  type = string
}

variable "default_region" {
  type    = string
  default = "us-east-1"
}

variable "deployment_role_arn" {
  type = string
}

variable "source_bucket_name" {
  type = string
}

variable "source_s3_prefix" {
  type    = string
  default = "web-resume"
}
