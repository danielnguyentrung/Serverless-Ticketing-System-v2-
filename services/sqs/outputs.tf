output "sqs_ticket_queue_arn" {
  value       = aws_sqs_queue.ticket_queue.arn
  description = "ARN of the SQS Ticket Queue"
}

output "sqs_ticket_queue_id" {
  value       = aws_sqs_queue.ticket_queue.id
  description = "ID of the SQS Ticket Queue"
}

output "sqs_ticket_queue_url" {
  value       = aws_sqs_queue.ticket_queue.url
  description = "URL of the SQS Ticket Queue"
}

output "dlq_arn" {
  value       = aws_sqs_queue.dlq.arn
  description = "ARN of the SQS Dead Letter Queue"
}

