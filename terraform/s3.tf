resource "aws_s3_bucket" "web_resume_app" {
  bucket        = var.source_bucket_name
  force_destroy = true
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
