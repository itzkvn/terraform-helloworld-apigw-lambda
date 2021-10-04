#!/bin/bash -e

docker run --tty --interactive --rm \
  --env "AWS_PROFILE=prod" \
  --volume "${PWD}:/hello-world" \
  --volume "${PWD}/aws_credentials:/root/.aws/credentials" \
  tf-wrapper:latest bash -c "cd terraform/envs/prod/ && terraform $@"
