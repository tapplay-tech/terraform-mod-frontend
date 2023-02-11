#General 
region = "us-east-1"

tags = {
  "Name" = "diversifica"
  "Env"  = "example"
}

#s3
s3_bucket_site = "test.diversifica.me"

#s3 object
s3_object_key  = "index.html"
s3_object_file = "./staticfiles/index.html"

#cloud front
cf_acm_certificate_arn      = "arn:aws:acm:us-east-1:490089276961:certificate/fc10d8ca-08c4-409d-919f-4aa5caa74115"
cf_minimum_protocol_version = "TLSv1"
cf_aliases                  = ["test.diversifica.me"]
cf_comment                  = "Frontend terraform test"
cf_default_root_object      = "index.html"
cf_enabled                  = "true"
cf_is_ipv6_enabled          = "true"
cf_log_include_cookies      = "false"
cf_locations                = ["PT", "BR", "US"]

#route53
r53_domainname = "test.diversifica.me"
r53_zone_id    = "/hostedzone/Z0033982188RJQRN2L9PI"
r53_type       = "A"
