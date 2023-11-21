variable "alarm_name" {
  type        = string
  description = "CloudWatch Alarm name"
  default     = "web-app-errors"
}

variable "alarm_description" {
  type        = string
  description = "CloudWatch Alarm description"
  default     = "CloudFront 4xx and 5xx errors"
}

variable "cloudfront_distribution_id" {
  type        = string
  description = "CloudFront Distribution ID to monitor"
}

variable "email_subscribers" {
  type        = list(string)
  description = "A list of emails to notify about CloudFront errors"
}
