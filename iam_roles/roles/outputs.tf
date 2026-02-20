# Output of the ARNs of the created IAM Roles 

# Ingress Lambda Role ARN

output "ingress_lambda_iam_role_arn" {
  description = "The ARN of the Ingress Lambda IAM Role"
  value = aws_iam_role.ingress_lambda_iam_role.arn
}

# TPL Role ARN

output "tpl_lambda_iam_role_arn" {
  description = "The ARN of the TPL IAM Role"
  value = aws_iam_role.tpl_lambda_iam_role.arn
}

# STC Role ARN

output "stc_lambda_iam_role_arn" {
  description = "The ARN of the STC IAM Role"
  value = aws_iam_role.stc_lambda_iam_role.arn
}