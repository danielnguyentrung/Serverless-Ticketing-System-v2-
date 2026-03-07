variable "customer_database_arn" {
  description = "DynamoDB Customer Table"
  type        = string
}

variable "sqs_ticket_queue_arn" {
  description = "SQS Ticket Queue ARN"
  type        = string
}

variable "ses_arn" {
  description = "SES ARN"
  type        = string
}

variable "cloudfront_distribution_arn" {
  description = "CloudFront Distribution ARN"
  type        = string
}


variable "it_ticket_portal_bucket_arn" {
  description = "S3 bucket ARN for IT Ticket Portal"
  type        = string
}

variable "it_ticket_portal_bucket_name" {
  description = "S3 bucket name for IT Ticket Portal"
  type        = string
}
