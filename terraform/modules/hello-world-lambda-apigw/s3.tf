resource "random_pet" "hello_world_bucket_name" {
  prefix = "never-seen-before-hello-world"
  length = 2
}

resource "aws_s3_bucket" "hello_world_bucket" {
  bucket        = random_pet.hello_world_bucket_name.id

  acl           = "private"
  force_destroy = true
}

data "archive_file" "hello_world_lambda" {
  type        = "zip"

  source_dir  = "${path.module}/../../../hello-world"
  output_path = "${path.module}/../../../hello-world.zip"
}

resource "aws_s3_bucket_object" "hello_world_lambda" {
  bucket = aws_s3_bucket.hello_world_bucket.id

  key    = "hello-world.zip"
  source = data.archive_file.hello_world_lambda.output_path

  etag   = filemd5(data.archive_file.hello_world_lambda.output_path)
}