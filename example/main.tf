module "s3" {
  source         = "../frontend/s3/"
  s3_bucket_site = var.s3_bucket_site
  tags           = var.tags
}

module "s3_object" {
  source           = "../frontend/s3_object/"
  s3_object_key    = var.s3_object_key
  s3_object_bucket = module.s3.bucket_site_id
  s3_object_file   = var.s3_object_file
}

module "cloudfront" {
  source                      = "../frontend/cloudfront/"
  cf_domainname               = module.s3.bucket_site_domainname
  cf_origin_id                = module.s3.bucket_site_domainname
  cf_acm_certificate_arn      = var.cf_acm_certificate_arn
  cf_minimum_protocol_version = var.cf_minimum_protocol_version
  cf_aliases                  = var.cf_aliases
  cf_locations                = var.cf_locations
}

module "route53" {
  source            = "../frontend/route53"
  r53_zone_id       = var.r53_zone_id
  r53_domainname    = var.r53_domainname
  r53_type          = var.r53_type
  cf_domain_name    = module.cloudfront.cf_domain_name
  cf_hosted_zone_id = module.cloudfront.cf_hosted_zone_id
}