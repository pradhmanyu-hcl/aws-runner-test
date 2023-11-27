variable "region" {
  description = "aws region"
  type = string
  default = "us-west-2"
}
variable "dashboard_name" {
  description = "Name of cloudwatch dashboard"
  type = string
  default = "sample-dashboard"
}
variable "alarm_name" {
  description = "The name of the metric alarm"
  type = string
  default = "ec2-cpu-usage"
}
variable "alarm_description" {
  description = "The description of the created alarm"
  type = string
  default = "The alarm is created to monitor the cpu usage"
}
variable "retention_in_days" {
  description = "days of retention for cloudwatch log group"
  type = number
  default = 365
}
variable "actions_enabled" {
  description = "Whether to execute the actions during alarm change state"
  type = bool
  default = true
}
variable "alarm_actions" {
  description = "The list of actions to be excuted when alarm goes into ALARM state"
  type = list(string)
  default = [ "value" ]
}
variable "ok_actions" {
  description = "The list of actions to be executed when alarm goes in OK state"
  type = list(string)
  default = [ "value" ]
}
variable "comparison_operator" {
  description = "The arithmetic operation for comparing the statistic to threshold"
  type = string
  default = "GreaterThanOrEqualToThreshold"
}
variable "evaluation_periods" {
  description = "The number of times the statistic is compared"
  type = number
  default = 2
}
variable "metric_name" {
  description = "The name of the metric"
  type = string
  default = "CPUUtilization"
}
variable "namespace" {
  description = "The namespace for alarm's associated metric"
  type = string
  default = "AWS/EC2"
}
variable "threshold" {
  description = "The value against the statstic is compared"
  type = number
  default = 80
}
variable "period" {
  description = "The number of seconds over which the statistic is applied"
  type = string
  default = "120"
}
variable "statistic" {
  description = "The statistic to apply to alarm's metric For example: SampleCount, Average, Sum, Minimum, Maximum"
  type = string
  default = "Average"
}
variable "insufficient_data_actions" {
  description = "The list of actions to be exceuted when alarm goes to INSUFFICIENT_DATA state"
  type = list(string)
  default = [ "value" ]
}
