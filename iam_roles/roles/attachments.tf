# Ingress Lambda attachements

resource "aws_iam_role_policy_attachment" "ingress_lambda_iam_sqs_send" {
    role = aws_iam_role.ingress_lambda_iam_role.name
    policy_arn = var.sqs_policy_arn
}

resource "aws_iam_role_policy_attachment" "ingress_lambda_logs"{
    role = aws_iam_role.ingress_lambda_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# TPL Role Attachment

resource "aws_iam_role_policy_attachment" "tpl_dynamodb_put_get_update"{
    role = aws_iam_role.tpl_lambda_iam_role.name
    policy_arn = var.dynamodb_put_get_update_policy_arn
}

resource "aws_iam_role_policy_attachment" "tpl_ses_send"{
    role = aws_iam_role.tpl_lambda_iam_role.name
    policy_arn = var.ses_send_policy_arn
}

resource "aws_iam_role_policy_attachment" "tpl_sqs_queue"{
    role = aws_iam_role.tpl_lambda_iam_role.name
    policy_arn = var.sqs_policy_arn
}

resource "aws_iam_role_policy_attachment" "tpl_cw_logs"{
    role = aws_iam_role.tpl_lambda_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "tpl_lambda_attach_bedrock"{
    role = aws_iam_role.tpl_lambda_iam_role.name
    policy_arn = var.bedrock_policy_arn
}

# STC Role Attachment

resource "aws_iam_role_policy_attachment" "stc_cw_logs"{
    role = aws_iam_role.stc_lambda_iam_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "stc_dynamodb_scan_update"{
    role = aws_iam_role.stc_lambda_iam_role.name
    policy_arn = var.dynamodb_scan_update_policy_arn
}

resource "aws_iam_role_policy_attachment" "stc_lambda_ses_send_policy"{
    role = aws_iam_role.stc_lambda_iam_role.name
    policy_arn = var.ses_send_policy_arn
}