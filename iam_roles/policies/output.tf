output "bedrock_policy_arn" {
  description = "The ARN of the Bedrock Policy"
  value = aws_iam_policy.tpl_lambda_bedrock_policy.arn
}

output "dynamodb_scan_update_policy_arn" {
    description = "The ARN of the DynamoDB Scan/Update Policy"
    value = aws_iam_policy.dynamodb_scan_update.arn
}

output "dynamodb_put_get_update_policy_arn" {
    description = "The ARN of the DynamoDB Put/Get/Update Policy"
    value = aws_iam_policy.dynamodb_put_get_update.arn
}

output "ses_send_policy_arn"{
    description = "The ARN of the SES Send Policy"
    value = aws_iam_policy.ses_send.arn
}

output "sqs_policy_arn" {
    description = "The ARN of the SQS Send Policy"
    value = aws_iam_policy.sqs_policy.arn
}