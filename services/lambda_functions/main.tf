# Ingress Lambda Function

resource "aws_lambda_function" "ingress_lambda" {
function_name = "ingress-lambda"

runtime = "python3.12"
handler = "ingress_lambda.handler"

role = var.ingress_lambda_iam_role_arn

filename  = "${path.module}/src/ingress_lambda.zip"
source_code_hash = filebase64sha256("${path.module}/src/ingress_lambda.zip")

timeout = 10 

environment {
    variables = {
        SQS_QUEUE_URL = var.sqs_ticket_queue_url
    }
  }
}

# Ticket Processor Lambda Function

resource "aws_lambda_function" "ticket_processor_lambda" {
function_name = "ticket-processor-lambda"

runtime ="python3.12"
handler = "ticket_processor_lambda.handler"

role = var.tpl_lambda_iam_role_arn

filename = "${path.module}/src/ticket_processor_lambda.zip"
source_code_hash = filebase64sha256("${path.module}/src/ticket_processor_lambda.zip")

timeout = 10

environment {
    variables = {
        USERS_TABLE = var.ticket_table_name
        SES_SENDER_EMAIL = var.ses_sender_email 
        }
    }
}

# Stale Ticket Checker Lambda Function

resource "aws_lambda_function" "stale_ticket_checker_lambda" {
function_name = "stale-ticket-checker-lambda"

runtime = "python3.12"
handler = "stale_ticket_checker_lambda.handler"

role = var.stc_lambda_iam_role_arn

filename = "${path.module}/src/stale_ticket_checker_lambda.zip"
source_code_hash = filebase64sha256("${path.module}/src/stale_ticket_checker_lambda.zip")

timeout = 10

environment {
    variables = {
        USERS_TABLE = var.ticket_table_name
        SES_SENDER_EMAIL = var.ses_sender_email
        IT_EMAIL = var.it_email 
        }
    }
}
