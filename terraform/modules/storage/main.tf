resource "aws_s3_bucket" "source_bucket" {
  bucket = var.source_bucket_name
}

data "aws_cloudfront_origin_access_identities" "identities" {
  comments = [var.source_bucket_name]
}

data "aws_cloudfront_origin_access_identity" "oai" {
  id = one(data.aws_cloudfront_origin_access_identities.identities.ids)
}

data "aws_iam_policy_document" "source_bucket_policy_document" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.source_bucket.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [data.aws_cloudfront_origin_access_identity.oai.iam_arn]
    }
  }

  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.source_bucket.arn]
    principals {
      type        = "AWS"
      identifiers = [data.aws_cloudfront_origin_access_identity.oai.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "source_bucket_policy" {
  bucket     = aws_s3_bucket.source_bucket.id
  policy     = data.aws_iam_policy_document.source_bucket_policy_document.json
  depends_on = [data.aws_iam_policy_document.source_bucket_policy_document]
}

resource "aws_s3_bucket_public_access_block" "source_bucket_access_policy" {
  bucket                  = aws_s3_bucket.source_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
