variable "cf_enabled" {
  default = "true"
}

variable "cf_is_ipv6_enabled" {
  default = "true"
}

variable "cf_comment" {
  default = "Terraform"
}

variable "cf_default_root_object" {
  default = "index.html"
}

variable "cf_log_include_cookies" {
  default = "false"
}

variable "cf_domainname" {
  type = string
}

variable "cf_origin_id" {
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

variable "cf_locations" {
  type = list(any)
}