# Serverless IT Ticketing System v2
A serverless IT Ticketing system built on AWS leveraging Amazon S3, CloudFront, API Gateway, SQS, Lambda, Bedrock, SES, and Eventbridge. 

## Objective

The objective for the Serverless Ticketing System version 2.0 was to design a secure, scalable, and cost-efficient cloud-native support platform capable of handling asynchronous ticket processing and automated operational workflows. 

## Solution Overview

The system was deployed using Infrastructure as Code (IAC) with Terraform to ensure repeatable and maintainable cloud infrastructure provisioning. 

Version 2 introduced several architectural improvements: 
- Implemented Amazon CloudFront to securely distribute static frontend content globally and to reduce latency.
- Integrated Amazon Bedrock to enable AI-assisted text analysis and problem type classification, improving the reliability and accuracy of ticket data processing. 
- Replaced SNS-based email delivery with Amazon SES for both internal and external users for cost-efficiency.
- Added an AI-generated ticket summary field within SES email notifications sent to internal members, improving ticket comprehension and operational productivity. 
- Introduced automated ticket assignment logic to distribute incoming support requests among team members based on the support tier classification. Team members are dynamically selected using randomized allocation aligned with ticket urgency levels, improving workload distribution, response efficiency, and reducing manual intervention.   

### Workflow

1. A user submits a support ticket through a CloudFront distribution serving static content from an Amazon S3 origin.
2. The request is routed through Amazon API Gateway to an ingress AWS Lambda function, which validates the ticket contents.
3. Validated ticket metadata is sent to Amazon SQS to enable asynchronous processing and decouple ticket submission from downstream workflows.
4. A Lambda consumer processes messages from Amazon SQS. The function validates ticket ownership by querying DynamoDB using the submitted user email and ticket ID. Once validated, ticket metadata is sent to Amazon Bedrock for ticket title, description, and problem type analysis.
5. After validation, the Lambda function determines ticket urgency using a keyword-based grading metric and dynamically assigns the ticket to a Tier 1, Tier 2, or Tier 3 support team member through randomized allocation based on the calculated urgency level.
6. If the submitting user is not registered in the system, their information is queued for onboarding and added to DynamoDB.
7. If the submitted problem type does not align with the ticket title and description, Amazon Bedrock (Claude) will automaticaly reclassies the ticket using the predefine problem-type list. 
8. Once the ticket has been processed, Amazon SES is used to notify the IT team, and end users.

### IT Team Notification Includes 
#### AI Validated Ticket Summary:
  - User's first and last name 
  - Email
  - Ticket ID
  - Ticket Title
  - Ticket Description
  - Problem Type
  - Ticket Urgency
  - Assigned team member
#### Original Ticket Submission:
  - Ticket Title
  - Problem Type
  - Ticket Description

### End User Notification Includes
- Ticket ID
- Assigned Team Member
- Original Ticket Title
- Original Ticket Description
- Ticket Urgency Level

9. Amazon EventBridge triggers a scheduled Lambda function daily to scan DynamoDB for tickets exceeding a seven-day threshold and notifies the IT team of stale tickets with full ticket details using SES.

Note: Amazon CloudWatch is enabled to collect logs and metrics from all serverless components for monitoring and operational visibility. 

### Architecture Diagram
![Serverless Ticketing System v2](https://github.com/user-attachments/assets/63a33a0f-623f-4daf-9668-0e32bc28267c)

### Ticket Submission Interface

The ticket submission interface is as a static web application hosted on Amazon S3 and globally distributed through an Amazon CloudFront distribution for secure, low-latency access. 

[View Live Website](https://d2mt240u469po7.cloudfront.net/)

## Lessons Learned
- Gained hands-on experience utilizing terraform to deploy AWS serverless services, including IAM policies and roles, AWS Lambda, Amazon SQS, Amazon SES, API Gateway, S3, CloudFront, Amazon Eventbridge, Amazon Bedrock. 
- Resolved challenges related to Lambda application logic, IAM policy configuration issues at both service and account levels, Terraform variable and output dependencies, and CORS configuration and validation issues, strengthening troubleshooting and debugging capabilities.
- Developed a deeper understanding of system monitoring and logging using Amazon CloudWatch and Cloudtrail, as well as leveraging AWS CloudShell to diagnose and resolve infrastructure and application errors.
- Learned the importance of designing cloud systems with a strong emphasis on cost efficiency and scalability while balancing performance and resource utilization.

