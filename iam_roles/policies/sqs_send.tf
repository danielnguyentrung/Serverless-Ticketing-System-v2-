# IAM Policy to allow sending messages to SQS Queue 

resource "aws_iam_policy" "sqs_policy" {
  name        = "SQS-Policy"
  description = "Send Message to SQS Queue"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sqs:SendMessage",
          "sqs:DeleteMessage",
          "sqs:ReceiveMessage",
          "sqs:GetQueueAttributes",
          "sqs:ChangeMessageVisibility"
        ]
        Resource = var.sqs_ticket_queue_arn
      }
    ]
  })
}
