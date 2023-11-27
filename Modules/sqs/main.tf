#sqs queue
resource "aws_sqs_queue" "name" {
  name = var.sqs_name
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds = var.message_retention_seconds
  max_message_size = var.max_message_size
  delay_seconds = var.delay_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds
  sqs_managed_sse_enabled = var.sse_enabled                        #server side encryption
  fifo_queue = var.fifo_queue
  tags = {
    Name = var.tags
  }
}