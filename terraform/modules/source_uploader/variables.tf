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

variable "s3_bucket_name" {
  type        = string
  description = "S3 Bucket name for file uploads"
}

variable "s3_prefix" {
  type        = string
  description = "S3 Bucket prefix (i.e. parent directory)"
}

variable "upload_dir" {
  type        = string
  description = "Path of a local directory to upload to S3, relative to the root module"
}
