provider "aws" {
  region = "${var.region}"
}

resource "aws_s3_bucket" "lambda_trigger_bucket" {
  bucket = "tf-${var.app_name}-lambda-invoke-${var.region}-bucket"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = "${aws_s3_bucket.lambda_trigger_bucket.id}"

  lambda_function {
    lambda_function_arn = "${aws_lambda_function.test_lambda.arn}"
    events              = ["s3:ObjectCreated:*"]
    filter_prefix       = "${var.filterprefix != "" ? var.filterprefix : "" }"
    filter_suffix       = "${var.filtersuffix != "" ? var.filtersuffix : "" } "
  }
}

resource "aws_lambda_function" "test_lambda" {
  filename         = "${var.lambda_source_package}"
  function_name    = "tf-${var.owner}-${var.app_name}-${var.region}-lambda"
  role             = "${aws_iam_role.lambda_role.arn}"
  handler          = "${var.lambda_handler}"
  source_code_hash = "${base64sha256(file(var.lambda_source_package))}"
  runtime          = "${var.lambda_runtime}"
  memory_size      = "${var.lambda_memory_size}"
  timeout          = "${var.lambda_timeout}"

  environment {
    variables = {
      region = "${var.region}"
    }
  }
}

resource "aws_lambda_permission" "allow_s3_ bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.test_lambda.arn}"
  principal     = "s3.amazonaws.com"
  source_arn    = "${aws_s3_bucket.lambda_trigger_bucket.arn}"
}
