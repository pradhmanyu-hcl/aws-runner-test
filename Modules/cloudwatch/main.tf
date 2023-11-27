#Cloudwatch dashboard
resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = var.dashboard_name

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "CPUUtilization",
            ]
          ]
          period = 300
          stat   = "Average"
          region = var.region
          title  = "EC2 Instance CPU"
        }
      },
      {
        type = "metric"
        width = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "NetworkIn"
            ]
          ]
          period = 60
          stat = "Maximum"
          region = var.region
          title = "EC2 Network In"
        }
      },
      {
        type = "metric"
        width = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "NetworkOut"
            ]
          ]
          period = 60
          stat = "Maximum"
          region = var.region
          title = "EC2 Network Out"
        }
      }
    ]
  })
}


#Cloudwatch metric alarm
resource "aws_cloudwatch_metric_alarm" "example" {
  alarm_name = var.alarm_name
  alarm_description = var.alarm_description
  actions_enabled = var.actions_enabled                    
  alarm_actions = var.alarm_actions
  ok_actions = var.ok_actions
  comparison_operator = var.comparison_operator
  evaluation_periods = var.evaluation_periods
  metric_name = var.metric_name
  namespace = var.namespace
  threshold = var.threshold
  period = var.period
  statistic = var.statistic
  insufficient_data_actions = var.insufficient_data_actions
}

#Cloudwatch log group
resource "aws_cloudwatch_log_group" "clg" {
  name = "ec2loggroup"
  retention_in_days = var.retention_in_days
  lifecycle {
    prevent_destroy = false
  }
}

#Cloudwatch event rule
resource "aws_cloudwatch_event_rule" "ec2rule" {
  name = "ec2-scaling-events"
  description = "Captures all scaling events"
  event_pattern = jsonencode({
    source = [
      "aws.autoscaling"
    ]
    detail-type = [
      "EC2 Instance Launch Successful",
      "EC2 Instance Terminate Successful",
      "EC2 Instance Launch Unsuccessful",
      "EC2 Instance Terminate Unsuccessful"
    ]
  })
}


#Cloudwatch log policy to allow cloudwatch to create logs and put logs
resource "aws_cloudwatch_log_resource_policy" "ec2logpolicy" {
  policy_name = "ec2logpolicy"
  policy_document = <<POLICY
  {
   "Version" : "2012-10-17",
   "Id" : "CWLogsPolicy",
   "Statement" : [
    {
        "Effect" : "Allow",
        "Principal" : {
            "Service" : [
                "events.amazonaws.com",
                "delivery.logs.amazonaws.com"
            ]
        },
        "Action" : [
            "logs:CreateLogStream",
            "logs:PutLogEvents"
        ],
        "Resource" : "${aws_cloudwatch_log_group.clg.arn}",
        "Condition" : {
            "ArnEquals" : {
                "aws:SourceArn" : "${aws_cloudwatch_event_rule.ec2rule.arn}"
            }
        }
    }
   ]
  }
  POLICY
}

#Cloudwatch event target
resource "aws_cloudwatch_event_target" "Cloudwatch" {
  rule = aws_cloudwatch_event_rule.ec2rule.name
  arn =  aws_cloudwatch_log_group.clg.arn                         #arn of cloudwatch log group
}