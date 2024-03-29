resource "aws_s3_object" "file_uploads" {
  for_each = fileset(var.upload_dir, "**/*")

  bucket       = var.source_bucket_name
  key          = "${var.source_bucket_prefix}/${each.key}"
  source       = "${var.upload_dir}/${each.key}"
  etag         = filemd5("${var.upload_dir}/${each.key}")
  content_type = var.file_types[element(split(".", basename(each.key)), length(split(".", basename(each.key))) - 1)]
}
