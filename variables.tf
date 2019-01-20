variable "region" {
  description = "The AWS region we want this bucket to live in."
  default     = "eu-central-1"
}

variable "owner" {
  default = "demo-test"
}

variable "app_name" {
  default = "lambda-sample-template"
}

variable "lambda_runtime" {
  default = "python2.7"
}

variable "lambda_memory_size" {
  default = "512"
}

variable "filtersuffix" {
  default = ".SUFFIX"
}

variable "filterprefix" {
  default = ".PREFIX"
}

variable "lambda_timeout" {
  default = "60"
}

variable "lambda_handler" {
  default = "lambda_function.lambda_handler"
}

variable "lambda_source_package" {
  default = "terraform-lambda/lambda_function.py.zip"
}

variable "is_s3_bucket_create" {
  description = "pass true incase of want to create new bucket, keep blank in case of use existing."
  default     = ""
}

count = "${var.is_s3_bucket_create == "" ? 1 : 0}"

variable "s3_bucket_source_arn" {
  description = "The S3 bucket arn if the bucket already existing,keep blacn if you want to create new."
  default     = ""
}
