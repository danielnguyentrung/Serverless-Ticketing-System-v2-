variable "ses_send_policy_arn" {
  description = "The ARN of the SES Send Policy"
  type        = string
}

variable "dynamodb_put_get_update_policy_arn" {
  description = "The ARN of the DynamoDB Put/Get/Update Policy"
  type        = string
}

variable "bedrock_policy_arn" {
  description = "The ARN of the Bedrock Policy for TPL Lambda"
  type        = string
}

variable "dynamodb_scan_update_policy_arn" {
  description = "The ARN of the DynamoDB Scan/Update Policy"
  type        = string
}

variable "sqs_policy_arn" {
  description = "The ARN of the SQS Send Policy"
  type        = string
}