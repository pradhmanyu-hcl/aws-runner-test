#creating lambda IAM
resource "aws_iam_role" "lambda_iam" {
  name = var.lambda_role_name
  assume_role_policy = <<EOF
{
    "Version" : "2012-10-17",
    "Statement" : [
       {
           "Effect" : "Allow",
           "Principal" : {
               "Service" : "lambda.amazonaws.com"
            },
           "Action" : "sts:AssumeRole" 
        }
    ]
}
EOF
}

#lambda role policy
resource "aws_iam_role_policy" "s3" {
  name = var.lambda_iam_policy_name
  role = aws_iam_role.lambda_iam.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Action": [
            "s3:*",
            "s3-object-lambda:*"
            ],
        "Effect": "Allow",
        "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "log_policy" {
  name   = "log-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        Action : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect : "Allow",
        Resource : "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "function_logging_policy_attachment" {
  role       = aws_iam_role.lambda_iam.id
  policy_arn = aws_iam_policy.log_policy.arn
}

#cloudwatch log group
resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = 365
}

data "archive_file" "lambda-code-archieve" {
  type        = "zip"
  source_file = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda_function.zip"
}

#lambda layer
resource "aws_lambda_layer_version" "python_layer" {
  layer_name = var.layer_name
  description = var.layer_desc
  compatible_runtimes = [var.runtime]
  filename   = "${path.module}/python.zip"
  source_code_hash = filebase64("${path.module}/python.zip")
}
#creating lambda
resource "aws_lambda_function" "test_lambda" {
  function_name = var.function_name
  role = aws_iam_role.lambda_iam.arn
  handler = "${var.handler_name}.lambda_handler"
  runtime = var.runtime
  timeout = var.timeout
  filename = "${path.module}/lambda_function.zip"
  memory_size = var.memory_size
  depends_on = [ aws_cloudwatch_log_group.lambda_log_group ]
  # vpc_config {
  #   subnet_ids = [var.prsubnet_id]
  #   security_group_ids = [var.sg_id]
  # }
  environment {
    variables = {
      TENENT_ID = var.TENENT_ID
      CLUSTER_INGEST_URI =var.CLUSTER_INGEST_URI
      DATABASE = var.DATABASE
      TABLE = var.TABLE
      MAPPING = var.MAPPING
      SECRET_ID = var.SECRET_ID
      app_id = var.app_id
      app_key = var.app_id
    }
  }
}

# #create a vpc endpoint     (creating for s3 bucket)
# resource "aws_vpc_endpoint" "s3" {
#   vpc_id = var.vpc_id
#   service_name = join(".",["com.amazonaws",var.region,"s3"])
# }

#s3 notification
resource "aws_s3_bucket_notification" "s3" {
  bucket = var.bucket_name
  lambda_function {
    lambda_function_arn = aws_lambda_function.test_lambda.arn
    events = ["s3:ObjectCreated:*"]
  }
  depends_on = [ aws_lambda_permission.test ]
}

resource "aws_lambda_permission" "test" {
  statement_id = "AllowS3Invoke"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name
  principal = "s3.amazonaws.com"
  source_arn = "arn:aws:s3:::${var.bucket_name}/*"
}