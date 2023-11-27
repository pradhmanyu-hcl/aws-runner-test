resource "aws_sns_topic" "example_topic" {
  name = var.sns_topic_name
  display_name = var.display_name
  #kms_master_key_id = ""        #arn of kms key for SSE
}

resource "aws_sns_topic_policy" "policy" {
  arn = aws_sns_topic.example_topic.arn
  policy = jsonencode(
    {
  "Version": "2008-10-17",
  "Id": "__default_policy_ID",
  "Statement": [
    {
      "Sid": "__default_statement_ID",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": [
        "SNS:Publish",
        "SNS:RemovePermission",
        "SNS:SetTopicAttributes",
        "SNS:DeleteTopic",
        "SNS:ListSubscriptionsByTopic",
        "SNS:GetTopicAttributes",
        "SNS:AddPermission",
        "SNS:Subscribe"
      ],
      "Resource": "",
      "Condition": {
        "StringEquals": {
          "AWS:SourceOwner": "var.account_id"
        }
      }
    }
  ]
}
  )
}

resource "aws_sns_topic_subscription" "example_subscription" {
  topic_arn = aws_sns_topic.example_topic.arn
  protocol  = var.protocol
  endpoint  = var.endpoint 
}