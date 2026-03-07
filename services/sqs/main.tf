resource "aws_sqs_queue" "dlq" {
  name                      = var.dlq_name
  message_retention_seconds = 1209600
}

resource "aws_sqs_queue" "ticket_queue" {
  name                       = var.queue_name
  visibility_timeout_seconds = 90


  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq.arn
    maxReceiveCount     = 5

  })
}

resource "aws_lambda_event_source_mapping" "ticket_queue_trigger" {

  event_source_arn = aws_sqs_queue.ticket_queue.arn
  function_name    = var.ticket_processor_lambda_arn

  enabled    = true
  batch_size = 1
}