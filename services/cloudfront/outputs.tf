output "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.it_ticket_portal_distribution.domain_name
}

output "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution"
  value       = aws_cloudfront_distribution.it_ticket_portal_distribution.arn
}

output "cloudfront_oac_id" {
  value = aws_cloudfront_origin_access_control.s3_oac.id
}