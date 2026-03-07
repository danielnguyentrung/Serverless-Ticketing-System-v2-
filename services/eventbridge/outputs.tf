output "eventbridge_invoke_stc_arn" {
  description = "The ARN of the EventBridge rule to invoke the STC Lambda"
  value       = aws_cloudwatch_event_rule.stale_ticket_daily_check.arn
}