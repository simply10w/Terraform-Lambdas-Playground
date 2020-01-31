resource "aws_kinesis_stream" "demo_terraform_stream" {
  name             = "demo-terraform-kinesis-stream"
  shard_count      = 1
  retention_period = 24

  tags = {
    Demo = "terraform"
  }
}

output "kinesis_stream_name" {
  value = aws_kinesis_stream.demo_terraform_stream.name
}
