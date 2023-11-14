variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "lambda_s3_bucket_name" {
  description = "Name of the S3 bucket containing builds.zip"
  default     = "Deployment"
}

variable "lambda_s3_object_key" {
  description = "Build pbject key"
  default     = "builds/build.zip" 
}

variable "lambda_handler_suffix" {
  description = "Lambda handler suffix"
  default     = "lambdaHandler"
}

variable "lambda_runtime" {
  description = "Runtime"
  default     = "nodejs14.x"
}

variable "tf_state_bucket" {
  description = "Bucket for tf state files"
  default     = "nodejs14.x"
}

variable "tf_state_object_key" {
  description = "terraform state file"
  default     = "terraform.tfstate"
}
