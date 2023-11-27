variable "sqs_name" {
  description = "Name of the sqs queue"
  type = string
  default = "sample-queue"
}
variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue. An integer from 0 to 43200 (12 hours). Default is 30."
  type = number
  default = 60
}
variable "message_retention_seconds" {
  description = "the number of seconds sqs retains the message. Integer represents seconds from 60(1 minute) to 1209600(14 days)"
  type = number
  default = 86400
}
variable "max_message_size" {
  description = "maximum size of sqs message in bytes"
  type = number
  default = 2048
}
variable "delay_seconds" {
  description = "The time in seconds that the delivvery of all messages in the queue will be delayed"
  type = number
  default = 90
}
variable "receive_wait_time_seconds" {
  description = "The time for which the receivemesaage call will wait for a message to arrive. Default is 0 means message will receive immediately"
  type = number
  default = 10
}
variable "sse_enabled" {
  description = "Whether to enable server side encryption"
  type = bool
  default = true
}
variable "tags" {
  description = "tag associated to the sqs queue"
  type = string
  default = "awsgov_sqs_usw_ccoe_prd_001"
}
variable "fifo_queue" {
  description = "Whether the queue is fifo"
  type = bool
  default = false
}