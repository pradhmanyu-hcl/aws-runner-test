data "archive_file" "lambda-code-archieve" {
  type        = "zip"
  source_file = "${path.module}/python/hello-python.py"
  output_path = "${path.module}/python/hello-python.zip"
  
}

# Define an IAM role for the Lambda function
resource "aws_iam_role" "lambda_role" {
  name = var.role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_lambda_function" "example" {
  #function_name = var.aws_lambda_function_name
  function_name = var.function_name
  handler       = var.handler
  runtime       = var.runtime
  role          = aws_iam_role.lambda_role.arn
  filename      = "${path.module}/python/hello-python.zip" 
  vpc_config {
    subnet_ids = [var.prsubnet_id]
    security_group_ids = [var.sg_id]
  }
}

#create a vpc endpoint     (creating for s3 bucket)
resource "aws_vpc_endpoint" "s3" {
  vpc_id = var.vpc_id
  service_name = join(".",["com.amazonaws",var.region,"s3"])
}

# Attach a basic execution policy to the IAM role (you can customize this)
resource "aws_iam_policy" "lambda_policy" {
  name        = var.iam_policy
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "ec2:DescribeInstances",
        "ec2:CreateNetworkInterface",
        "ec2:AttachNetworkInterface",
        "ec2:DescribeNetworkInterfaces",
        "autoscaling:CompleteLifecycleAction",
        "ec2:DeleteNetworkInterface"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  policy_arn = aws_iam_policy.lambda_policy.arn
  role       = aws_iam_role.lambda_role.name
}
