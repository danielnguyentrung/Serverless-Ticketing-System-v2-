variable "dlq_name"{
    description = "queue_name"
    type = string
}

variable "queue_name"{
    description = "Name of the SQS Ticket Queue"
    type = string 
}

variable "ticket_processor_lambda_arn" {
    description ="ARN of the Ticket Processor Lambda Function"
    type = string
}
