# S3 Bucket for IT Ticket Portal Submissions

resource "aws_s3_bucket" "it_ticket_portal" {
    bucket = "it-ticket-portal-${var.environment}-bucket"
}

# S3 Bucket Public Access Block for IT Ticket Portal

resource "aws_s3_bucket_public_access_block" "it_ticket_portal_block" {
    bucket = aws_s3_bucket.it_ticket_portal.id

    block_public_acls = true 
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true  
}

# Enable Versioning on IT Ticket Portal S3 Bucket

resource "aws_s3_bucket_versioning" "it_ticket_portal_versioning" {
    bucket = aws_s3_bucket.it_ticket_portal.id
    versioning_configuration {
        status = "Enabled"
    }
}


# KMS Key for S3 Bucket Encryption

resource "aws_s3_bucket_server_side_encryption_configuration" "it_ticket_portal_encyrption" {
    bucket = aws_s3_bucket.it_ticket_portal.id

    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
}

# Upload index.html to S3 Bucket 

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.it_ticket_portal.id
  key          = "index.html"
  source       = "s3_frontend/index.html"
  content_type = "text/html"
  etag         = filemd5("s3_frontend/index.html")
}

# Upload error.html to S3 Bucket 

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.it_ticket_portal.id
  key          = "error.html"
  source       = "s3_frontend/error.html"
  content_type = "text/html"
  etag         = filemd5("s3_frontend/error.html")
}