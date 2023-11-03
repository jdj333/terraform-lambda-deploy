provider "aws" {
  region = var.aws_region
}

terraform {
  cloud {
    organization = "CoffeeTrendsUSA"

    workspaces {
      name = "TERRAFORM-DEPLOY"
    }
  }
}

resource "aws_lambda_function" "test_lambda" {
  filename      = var.lambda_function_path
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime

  environment {
    variables = var.lambda_environment
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name = var.lambda_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_api_gateway_rest_api" "test_api" {
  name        = var.api_name
  description = "Test API Gateway"
}

resource "aws_api_gateway_resource" "test_resource" {
  parent_id   = aws_api_gateway_rest_api.test_api.root_resource_id
  path_part   = "test"
  rest_api_id = aws_api_gateway_rest_api.test_api.id
}

# Define other resources here (API Gateway method, Lambda permission, integration, deployment)

