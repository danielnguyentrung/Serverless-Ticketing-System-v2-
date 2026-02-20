resource "aws_iam_policy" "tpl_lambda_bedrock_policy"{
    name = "tpl_lambda_bedrock_policy"
    description = "Allow Lambda to call Bedrock"

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Action = ["bedrock:InvokeModel"]
                Resource = "*"
            }
        ]
    })
}