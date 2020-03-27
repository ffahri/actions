provider "aws" {
  version = "~> 2.0"
  region  = "eu-central-1"
}
variable "role_arn" {
  type = string
}
### EXACT EXAMPLE FROM https://www.terraform.io/docs/providers/aws/r/lambda_function.html
resource "aws_lambda_function" "github_actions_lambda" {
  filename      = "lambda.zip"
  function_name = "github-actions-test-function"
  role          = var.role_arn
  handler       = "main"


  source_code_hash = filebase64sha256("lambda.zip")

  runtime = "go1.x"

  environment {
    variables = {
      message = "hello blog"
    }
  }
}
