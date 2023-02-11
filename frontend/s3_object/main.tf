resource "aws_s3_object" "site" {
  bucket       = var.s3_object_bucket
  key          = var.s3_object_key
  source       = var.s3_object_file
  content_type = "text/html"
  acl          = "public-read"
}