resource "aws_sqs_queue" "dlq" {
    name = var.dlq_name 
    message_retention_seconds = 1209600
    }  

resource "aws_sqs_queue" "ticket_queue" {
    name = var.queue_name 
    visibility_timeout_seconds = 60 
    

    redrive_policy = jsonencode({
        deadLetterTargetArn = aws_sqs_queue.dlq.arn
        maxReceiveCount     = 5

    })
}