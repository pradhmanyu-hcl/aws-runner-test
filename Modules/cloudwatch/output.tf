output "cloudwatch_metric_alarm" {
  value = aws_cloudwatch_metric_alarm.example.alarm_name
}