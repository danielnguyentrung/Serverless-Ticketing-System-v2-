resource "aws_cloudwatch_event_rule" "stale_ticket_daily_check" {
  name                = "stale-ticket-daily-checker"
  description         = "Run stale ticket checker daily"
  schedule_expression = "rate(1 day)"
}

resource "aws_cloudwatch_event_target" "stale_ticket_target" {
  rule = aws_cloudwatch_event_rule.stale_ticket_daily_check.name
  arn  = var.stale_ticket_checker_lambda_arn
}

resource "aws_lambda_permission" "allow_eventbridge_invoke_stc" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = var.stale_ticket_checker_lambda_arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.stale_ticket_daily_check.arn
}

