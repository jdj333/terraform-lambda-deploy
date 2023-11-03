variable "aws_region" {
  description = "AWS region where resources will be created."
  default     = "us-east-1"
}

variable "lambda_function_path" {
  description = "Path to the Lambda deployment package (ZIP file)."
}

variable "lambda_function_name" {
  description = "Name of the Lambda function."
  default = "test"
}

variable "lambda_handler" {
  description = "Handler function for the Lambda."
}

variable "lambda_runtime" {
  description = "Runtime for the Lambda function."
  default     = "nodejs14.x"
}

variable "lambda_environment" {
  description = "Environment variables for the Lambda function."
  type        = map(string)
  default     = {}
}

variable "lambda_role_name" {
  description = "Name of the IAM role for the Lambda function."
}

variable "api_name" {
  description = "Name of the API Gateway."
}

# Define other variables here
