# IAM Role for Ingress Lambda Function

resource "aws_iam_role" "ingress_lambda_iam_role" {
  name = "ingress_lambda_iam_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}
