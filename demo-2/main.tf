resource "aws_iam_role" "lambda_role" {
  name = "LambdaRole"
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

resource "aws_iam_policy" "deployment_bucket_access" {
  name = "DeploymentBucketAccess"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject",
      ],
      "Resource": "arn:aws:s3:::${var.lambda_s3_bucket_name}/*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_exec_policy_attatchment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


resource "aws_iam_role_policy_attachment" "lambda_s3_access_policy_attatchment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.deployment_bucket_access.arn
}


resource "aws_lambda_function" "service1_lambda" {
  function_name    = "Service1"
  handler          = "Service1.${var.lambda_handler_suffix}"
  runtime          = var.lambda_runtime
  s3_bucket        = var.lambda_s3_bucket_name
  s3_key           = var.lambda_s3_object_key
  role             = aws_iam_role.lambda_role.arn
}

resource "aws_lambda_function" "service2_lambda" {
  function_name    = "Service2"
  handler          = "Service2.${var.lambda_handler_suffix}"
  runtime          = var.lambda_runtime
  s3_bucket        = var.lambda_s3_bucket_name
  s3_key           = var.lambda_s3_object_key
  role             = aws_iam_role.lambda_role.arn
}

resource "aws_lambda_function" "service3_lambda" {
  function_name    = "Service3"
  handler          = "Service3.${var.lambda_handler_suffix}"
  runtime          = var.lambda_runtime
  s3_bucket        = var.lambda_s3_bucket_name
  s3_key           = var.lambda_s3_object_key
  role             = aws_iam_role.lambda_role.arn
}
