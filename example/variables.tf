variable "cf_enabled" {
  type = string
}

variable "cf_is_ipv6_enabled" {
  type = string
}

variable "cf_comment" {
  type = string
}

variable "cf_default_root_object" {
  type = string
}

variable "cf_log_include_cookies" {
  type = string
}

variable "r53_domainname" {
  type = string
}

variable "cf_acm_certificate_arn" {
  type = string
}

variable "cf_minimum_protocol_version" {
  type = string
}

variable "cf_aliases" {
  type = list(any)
}

variable "region" {
  type = string
}

variable "s3_bucket_site" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "s3_object_file" {
  type = string
}

variable "s3_object_key" {
  type = string
}

variable "r53_zone_id" {
  type = string
}

variable "r53_type" {
  type = string
}