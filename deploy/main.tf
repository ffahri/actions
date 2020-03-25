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
  function_name = "lambda_function_name"
  role          = var.role_arn
  handler       = "main"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("lambda.zip")

  runtime = "go1.x"

  environment {
    variables = {
      message = "hello"
    }
  }
}
