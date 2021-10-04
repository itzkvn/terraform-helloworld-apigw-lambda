resource "aws_lambda_function" "hello_world" {
  function_name    = "${var.function_name}"
  runtime          = "${var.runtime}"
  handler          = "${var.handler}"

  s3_bucket        = aws_s3_bucket.hello_world_bucket.id
  s3_key           = aws_s3_bucket_object.hello_world_lambda.key

  source_code_hash = data.archive_file.hello_world_lambda.output_base64sha256

  role = aws_iam_role.lambda_exec.arn
}

resource "aws_iam_role" "lambda_exec" {
  name = "serverless_lambda"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}