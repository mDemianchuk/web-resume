resource "aws_sns_topic" "web_app_errors" {
  name = var.alarm_name
}

resource "aws_sns_topic_subscription" "email_subscription" {
  for_each = var.email_subscribers

  topic_arn = aws_sns_topic.web_app_errors.arn
  protocol  = "email"
  endpoint  = each.value
}

resource "aws_cloudwatch_metric_alarm" "web_app_errors" {
  alarm_name          = var.alarm_name
  alarm_description   = var.alarm_description
  alarm_actions       = [aws_sns_topic.web_app_errors]
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "TotalErrorRate"
  namespace           = "AWS/CloudFront"
  period              = "900"
  statistic           = "SampleCount"
  threshold           = "0"
  treat_missing_data  = "notBreaching"
  dimensions = {
    DistributionId = var.cloudfront_distribution_id
    Region         = "Global"
  }
}
