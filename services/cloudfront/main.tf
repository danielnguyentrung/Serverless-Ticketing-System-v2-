resource "aws_cloudfront_origin_access_control" "s3_oac" {
  name                              = "s3-it-ticket-portal-oac"
  description                       = "OAC for It ticket portal S3 bucket access"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "it_ticket_portal_distribution" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name              = var.it_ticket_portal_bucket_regional_domain_name
    origin_id                = "s3-static-origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.s3_oac.id
  }


  default_cache_behavior {
    target_origin_id = "s3-static-origin"

    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]

    cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
  }

  price_class = "PriceClass_100"
}
