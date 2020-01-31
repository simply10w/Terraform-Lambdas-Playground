resource "aws_sqs_queue" "demo_terraform_queue" {
  name                        = "demo-terraform-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true

  tags = {
    Demo = "terraform"
  }
}

output "sqs_queue_name" {
  value = aws_sqs_queue.demo_terraform_queue.name
}
