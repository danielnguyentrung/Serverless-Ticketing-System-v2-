module "iam_policies" {
  source                       = "./iam_roles/policies"
  customer_database_arn        = module.dynamodb.customer_database_arn
  sqs_ticket_queue_arn         = module.sqs.sqs_ticket_queue_arn
  ses_arn                      = local.ses_arn
  it_ticket_portal_bucket_arn  = module.s3_bucket.it_ticket_portal_bucket_arn
  cloudfront_distribution_arn  = module.cloudfront.cloudfront_distribution_arn
  it_ticket_portal_bucket_name = module.s3_bucket.it_ticket_portal_bucket_name
}

data "aws_caller_identity" "current" {}

locals {
  ses_arn = "arn:aws:ses:${var.aws_region}:${data.aws_caller_identity.current.account_id}:identity/${var.sender_email}"
}

module "iam_roles" {
  source                             = "./iam_roles/roles"
  ses_send_policy_arn                = module.iam_policies.ses_send_policy_arn
  bedrock_policy_arn                 = module.iam_policies.bedrock_policy_arn
  dynamodb_put_get_update_policy_arn = module.iam_policies.dynamodb_put_get_update_policy_arn
  dynamodb_scan_update_policy_arn    = module.iam_policies.dynamodb_scan_update_policy_arn
  sqs_policy_arn                     = module.iam_policies.sqs_policy_arn
}

module "api_gateway" {
  source             = "./services/apigateway"
  ingress_lambda_arn = module.lambda_functions.ingress_lambda_arn
}

module "cloudfront" {
  source                                       = "./services/cloudfront"
  it_ticket_portal_bucket_regional_domain_name = module.s3_bucket.it_ticket_portal_bucket_regional_domain_name
}

module "dynamodb" {
  source = "./services/dynamodb"
}

module "eventbridge" {
  source                          = "./services/eventbridge"
  stale_ticket_checker_lambda_arn = module.lambda_functions.stale_ticket_checker_lambda_arn
}

module "sqs" {
  source                      = "./services/sqs"
  queue_name                  = "ticket-queue"
  dlq_name                    = "ticket-queue-dlq"
  ticket_processor_lambda_arn = module.lambda_functions.ticket_processor_lambda_arn
}

module "lambda_functions" {
  source                      = "./services/lambda_functions"
  ingress_lambda_iam_role_arn = module.iam_roles.ingress_lambda_iam_role_arn
  tpl_lambda_iam_role_arn     = module.iam_roles.tpl_lambda_iam_role_arn
  stc_lambda_iam_role_arn     = module.iam_roles.stc_lambda_iam_role_arn
  sqs_ticket_queue_url        = module.sqs.sqs_ticket_queue_url
  ticket_table_name           = module.dynamodb.ticket_table_name
  ses_sender_email            = var.sender_email
  it_email                    = var.it_email
}

module "s3_bucket" {
  source      = "./services/s3"
  environment = var.environment
}

module "ses" {
  source           = "./services/ses"
  ses_sender_email = var.sender_email
}

