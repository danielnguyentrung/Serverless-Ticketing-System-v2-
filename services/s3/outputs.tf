output "it_ticket_portal_bucket_name" {
  description = "The name of the IT Ticket Portal S3 Bucket"
  value       = aws_s3_bucket.it_ticket_portal.id
}

output "it_ticket_portal_bucket_arn" {
  description = "The ARN of the IT Ticket Portal S3 Bucket"
  value       = aws_s3_bucket.it_ticket_portal.arn
}

output "it_ticket_portal_bucket_regional_domain_name" {
  value = aws_s3_bucket.it_ticket_portal.bucket_regional_domain_name
}

