output "cf_domain_name" {
  description = "The domain name corresponding to the distribution."
  value       = element(concat(aws_cloudfront_distribution.cf.*.domain_name, [""]), 0)
}

output "cf_hosted_zone_id" {
  description = "The CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to."
  value       = element(concat(aws_cloudfront_distribution.cf.*.hosted_zone_id, [""]), 0)
}
