# API Gateway URL for Ticket Queue Service

output "ticketqueue_api_url" {
    description = "URL of the Ticket Queue API"
    value = aws_apigatewayv2_api.ticket_api.api_endpoint 
}