output "customer_database_arn" {
  description = "ARN of the Customer Database DynamoDB Table"
  value       = aws_dynamodb_table.customer_database.arn
}

output "ticket_table_name" {
  description = "Name of the Client Database DynamoDB Table"
  value       = aws_dynamodb_table.customer_database.name
}