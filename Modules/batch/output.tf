output "aws_batch_job_definition" {
  value = aws_batch_job_definition.example.name
}

output "aws_batch_compute_environment" {
  value = aws_batch_compute_environment.sample.compute_environment_name
}

output "aws_batch_job_queue" {
  value = aws_batch_job_queue.test_queue.name
}

output "aws_batch_scheduling_policy" {
  value = aws_batch_scheduling_policy.example.name
}