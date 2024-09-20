data "aws_s3_object" "handle_github_webhook" {
  bucket = var.lambda_bucket
  key    = "handle-github-webhook.zip"
}

resource "aws_lambda_function" "handle_github_webhook" {
  function_name    = "handle-github-webhook"
  handler          = "bootstrap"
  runtime          = "provided.al2"
  s3_bucket        = var.lambda_bucket
  timeout          = 300
  s3_key           = "handle-github-webhook.zip"
  role             = var.repo_collector_role_arn
  source_code_hash = data.aws_s3_object.handle_github_webhook.version_id

  vpc_config {
    security_group_ids = var.security_groups_ids
    subnet_ids         = var.subnet_ids
  }

  environment {
    variables = {
      DB_HOST     = "platzi-course.ca6u1fhrgyw2.us-east-2.rds.amazonaws.com"
      DB_PORT     = "5432"
      DB_USER     = "platzi"
      DB_PASSWORD = "rds!db-0f4f325a-bd83-4db0-b036-856d4f83060c" 
      DB_NAME     = "postgres"

      GITHUB_SECRET = "github/secret"
    }
  }
}

output "handle_github_webhook_invoke_arn" {
  value = aws_lambda_function.handle_github_webhook.invoke_arn
}

output "handle_github_webhook_lambda_name" {
  value = aws_lambda_function.handle_github_webhook.function_name
}