resource "aws_cloudfront_distribution" "cf" {
  enabled             = var.cf_enabled
  is_ipv6_enabled     = var.cf_is_ipv6_enabled
  comment             = var.cf_comment
  default_root_object = var.cf_default_root_object
  aliases             = var.cf_aliases

  origin {
    domain_name = var.cf_domainname
    origin_id   = var.cf_origin_id
  }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.cf_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = var.cf_locations
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    acm_certificate_arn            = var.cf_acm_certificate_arn
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = var.cf_minimum_protocol_version
  }
}