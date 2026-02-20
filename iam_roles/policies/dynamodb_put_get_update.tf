# IAM Policy to allow PutItem, GetItem and UpdateItem actions on DynamoDB Table 

resource "aws_iam_policy" "dynamodb_put_get_update" {
    name = "dynamodb_put_get_update"
    description = "Allows PutItem, GetItem and Update Item actions on DynamoDB Table"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Action = [
            "dynamodb:PutItem",
            "dynamodb:GetItem",
            "dynamodb:UpdateItem"
          ]
          Resource = var.customer_database_arn
        }
      ]
  })
}
