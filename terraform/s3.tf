locals {
  source_base_path = "${path.root}/dist"
  source_s3_prefix = "web-resume"
}

resource "aws_s3_bucket" "web_resume_app" {
  bucket = var.source_bucket_name
}

resource "aws_s3_bucket_website_configuration" "web_resume_app" {
  bucket = aws_s3_bucket.web_resume_app.id

  index_document {
    suffix = "index.html"
  }
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.web_resume_app.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.web_resume_app.iam_arn]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.web_resume_app.arn]
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.web_resume_app.iam_arn]
    }
  }

  depends_on = [aws_cloudfront_origin_access_identity.web_resume_app]
}

resource "aws_s3_bucket_policy" "web_resume_app" {
  bucket     = aws_s3_bucket.web_resume_app.id
  policy     = data.aws_iam_policy_document.bucket_policy.json
  depends_on = [data.aws_iam_policy_document.bucket_policy]
}

resource "aws_s3_bucket_public_access_block" "web_resume_app" {
  bucket                  = aws_s3_bucket.web_resume_app.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_cors_configuration" "web_resume_app" {
  bucket = aws_s3_bucket.web_resume_app.bucket

  cors_rule {
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_object" "js" {
  for_each = fileset("${local.source_base_path}/", "**/*.js")

  bucket       = aws_s3_bucket.web_resume_app.id
  key          = "${local.source_s3_prefix}/${each.value}"
  source       = "${local.source_base_path}/${each.value}"
  etag         = filemd5("${local.source_base_path}/${each.value}")
  content_type = "text/javascript"
}

resource "aws_s3_object" "css" {
  for_each = fileset("${local.source_base_path}/", "**/*.css")

  bucket       = aws_s3_bucket.web_resume_app.id
  key          = "${local.source_s3_prefix}/${each.value}"
  source       = "${local.source_base_path}/${each.value}"
  etag         = filemd5("${local.source_base_path}/${each.value}")
  content_type = "text/css"
}

resource "aws_s3_object" "map" {
  for_each = fileset("${local.source_base_path}/", "**/*.map")

  bucket       = aws_s3_bucket.web_resume_app.id
  key          = "${local.source_s3_prefix}/${each.value}"
  source       = "${local.source_base_path}/${each.value}"
  etag         = filemd5("${local.source_base_path}/${each.value}")
  content_type = "application/json"
}

resource "aws_s3_object" "html" {
  for_each = fileset("${local.source_base_path}/", "**/*.html")

  bucket       = aws_s3_bucket.web_resume_app.id
  key          = "${local.source_s3_prefix}/${each.value}"
  source       = "${local.source_base_path}/${each.value}"
  etag         = filemd5("${local.source_base_path}/${each.value}")
  content_type = "text/html"
}

resource "aws_s3_object" "ico" {
  for_each = fileset("${local.source_base_path}/", "**/*.ico")

  bucket       = aws_s3_bucket.web_resume_app.id
  key          = "${local.source_s3_prefix}/${each.value}"
  source       = "${local.source_base_path}/${each.value}"
  etag         = filemd5("${local.source_base_path}/${each.value}")
  content_type = "image/x-icon"
}
