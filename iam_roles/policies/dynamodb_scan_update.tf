# IAM Policy to allow Scan and UpdateItem actions on DynamoDB Table

resource "aws_iam_policy" "dynamodb_scan_update" {
  name        = "DynamoDB_ScanUpdate"
  description = "Allows Scan and UpdateItem actions on DynamoDB Table"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "dynamodb:Scan",
          "dynamodb:UpdateItem"
        ]
        Resource = var.customer_database_arn
      }
    ]
  })
}