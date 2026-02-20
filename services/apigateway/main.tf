# API Gateway for Ticket Queue Service

resource "aws_apigatewayv2_api" "ticket_api" {
    name = "ticket-api"
    protocol_type = "HTTP"
}

# API Gateway integration with Ingress Lambda

resource "aws_apigatewayv2_integration" "ingress_lambda_integration"{
  api_id = aws_apigatewayv2_api.ticket_api.id
  integration_type = "AWS_PROXY"
  integration_uri = var.ingress_lambda_arn 
  payload_format_version = "2.0"
}

# API Gateway Routes
# API Gateway POST /tickets route

resource "aws_apigatewayv2_route" "post_ticket" {
  api_id = aws_apigatewayv2_api.ticket_api.id
  route_key = "POST /tickets"
  target = "integrations/${aws_apigatewayv2_integration.ingress_lambda_integration.id}"
}

# API Gateway OPTIONS /tickets route (CORS)

resource "aws_apigatewayv2_route" "options_tickets" {
  api_id = aws_apigatewayv2_api.ticket_api.id
  route_key = "OPTIONS /tickets"
  target = "integrations/${aws_apigatewayv2_integration.ingress_lambda_integration.id}"
}

# API Gateway Auto Deployment Stage 

resource "aws_apigatewayv2_stage" "default" {
  api_id = aws_apigatewayv2_api.ticket_api.id
  name = "default" 
  auto_deploy = true
}

# API Gateway permission to allow invocation of Ingress Lambda 

resource "aws_lambda_permission" "allow_api_invoke" {
  statement_id = "AllowAPIGatewayInvoke"
  action = "lambda:InvokeFunction"
  function_name = var.ingress_lambda_arn
  principal = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.ticket_api.execution_arn}/*/*"
}