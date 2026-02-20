# Output ARN for Ingress Lambda 

output "ingress_lambda_arn" {
    value = aws_lambda_function.ingress_lambda.arn
    description = "ARN of the Ingress Lambda Function"
}

# Output ARN for Ticket Processor Lambda 

output "ticket_processor_lambda_arn" {
    value = aws_lambda_function.ticket_processor_lambda.arn
    description = "ARN of the Ticket Processor Lambda Function"
}

# Output ARN for Stale Ticket Checker Lambda

output "stale_ticket_checker_lambda_arn" {
    value = aws_lambda_function.stale_ticket_checker_lambda.arn
    description = "ARN of the Stale Ticket Checker Lambda Function"
}