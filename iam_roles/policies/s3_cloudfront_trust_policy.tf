resource "aws_s3_bucket_policy" "it_ticket_portal_policy" {
    bucket = var.it_ticket_portal_bucket_name

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Principal = {
                    Service = "cloudfront.amazonaws.com"
                }
                Action = "s3:GetObject"
                Resource = "${var.it_ticket_portal_bucket_arn}/*"
                Condition = {
                    StringEquals = {
                        "AWS:SourceArn" = var.cloudfront_distribution_arn
                    }
                }
            }
        ]
    })
}