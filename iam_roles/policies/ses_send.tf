# IAM Policy to allow sending emails using SES

resource "aws_iam_policy" "ses_send" {
  name = "SESSend"
  description = "Send Email using SES"

  policy = jsonencode({ 
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ses:SendEmail", 
          "ses:SendRawEmail"
        ]
        Resource = var.ses_arn

      }
    ]
  })
}