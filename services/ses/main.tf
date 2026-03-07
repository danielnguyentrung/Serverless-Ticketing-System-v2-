resource "aws_ses_email_identity" "sender" {
  email = var.ses_sender_email
}

resource "aws_iam_policy" "ticket_ses_send_email" {
  name = "ticket-ses-send-email"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ses:SendEmail",
          "ses:SendRawEmail"
        ]
        Resource = "*"
      }
    ]
  })
}

