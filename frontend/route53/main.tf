resource "aws_route53_record" "zone" {
  zone_id = var.r53_zone_id
  name    = var.r53_domainname
  type    = var.r53_type

  alias {
    name                   = var.cf_domain_name
    zone_id                = var.cf_hosted_zone_id
    evaluate_target_health = false
  }
}