# DynamoDB Table for Client and Ticket Information

resource "aws_dynamodb_table" "customer_database" {
    name = "customer-database"
    hash_key = "email"

    attribute {
        name = "email"
        type = "S"
    }

    billing_mode = "PAY_PER_REQUEST"
}
