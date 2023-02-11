variable "region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_site" {
  type = string
}

variable "tags" {
  type = map(string)
}