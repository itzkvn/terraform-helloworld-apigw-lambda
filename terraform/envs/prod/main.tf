provider "aws" {
  profile = "prod"
  region  = "us-east-2"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.48.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.2.0"
    }
  }

  required_version = "~> 1.0"
}

module "hello-world-lambda-apigw" {
  source        = "../../modules/hello-world-lambda-apigw"

  aws_region    = "us-east-2"

  stage_name    = "prod"

  runtime       = "python3.8"
  handler       = "lambda.handler"
  function_name = "HelloWorld"
}