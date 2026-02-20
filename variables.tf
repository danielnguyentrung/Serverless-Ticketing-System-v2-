variable "ses_sender_email" {
  type        = string
  description = "SES Sender Email for sending notifications"
}

variable "ticket_table_name" {
  type        = string
  description = "DynamoDB Table for storing tickets"
}

variable "environment" {
  type        = string
  description = "Environment name (dev, prod, etc.)"
}


variable "aws_region" {
  description = "AWS Region"
  type = string
}
