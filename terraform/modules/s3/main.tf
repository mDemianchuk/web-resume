resource "aws_s3_bucket" "web_resume_app" {
  bucket = var.source_bucket_name
}

resource "aws_s3_bucket" "web_resume_app_logs" {
  bucket = var.log_bucket_name
}

resource "aws_s3_bucket_website_configuration" "web_resume_app" {
  bucket = aws_s3_bucket.web_resume_app.id
  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_cors_configuration" "web_resume_app" {
  bucket = aws_s3_bucket.web_resume_app.bucket
  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.web_resume_app.arn}/*"]
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
  }
}

resource "aws_s3_bucket_policy" "web_resume_app" {
  bucket = aws_s3_bucket.web_resume_app.id
  policy = data.aws_iam_policy_document.bucket_policy.json
}

resource "aws_s3_bucket_public_access_block" "web_resume_app" {
  bucket              = aws_s3_bucket.web_resume_app.id
  block_public_acls   = true
  block_public_policy = true
}

resource "aws_s3_bucket_public_access_block" "web_resume_app_logs" {
  bucket              = aws_s3_bucket.web_resume_app_logs.id
  block_public_acls   = true
  block_public_policy = true
}
