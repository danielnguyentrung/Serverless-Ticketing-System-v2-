# IAM Policy to allow sending messages to SQS Queue 

resource "aws_iam_policy" "sqs_send" {
  name = "SQSSend"
  description = "Send Message to SQS Queue"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sqs:SendMessage"
        ]
        Resource = var.sqs_ticket_queue_arn
      }
    ]
  })
}
