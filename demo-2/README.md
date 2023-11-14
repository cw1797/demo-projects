## backend.tf
- Managing statefile in s3

## iam.tf
- Using IAM to allow lambda to assume it's necessary roles needed to fetch the s3 object and unpack

## provider.tf
- Specifying aws provider and region

## variables.tf
- To avoid duplication everything consistent between the lambda function resources are being stored as variables 

## main.tf
- 3 Lambdas are provisioned and configured to source functions from build.zip located in a bucket called Deployment
