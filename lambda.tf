locals {
  lambda_zip_file = "outputs/welcome.zip"
  encrpytion      = "zip"
  lambda_src_file = "welcome.py"
  handler         = "welcome.hello"
  python_version  = "python3.7"
}

data "archive_file" "welcome" {
  type        = local.encrpytion
  source_file = local.lambda_src_file
  output_path = local.lambda_zip_file
}

resource "aws_lambda_function" "demo_lambda" {
  function_name = "demo_lambda_terraform"
  filename      = local.lambda_zip_file
  role          = aws_iam_role.demo_lambda_role.arn
  handler       = local.handler
  runtime       = local.python_version

  tags = {
    Demo = "terraform"
  }
}

output "lambda_name" {
  value = aws_lambda_function.demo_lambda.function_name
}

resource "aws_lambda_event_source_mapping" "connect_demo_sqs_queue" {
  event_source_arn = aws_sqs_queue.demo_terraform_queue.arn
  function_name    = aws_lambda_function.demo_lambda.arn
}

resource "aws_lambda_event_source_mapping" "connect_demo_kinesis_stream" {
  event_source_arn  = aws_kinesis_stream.demo_terraform_stream.arn
  function_name     = aws_lambda_function.demo_lambda.arn
  starting_position = "LATEST"
}
