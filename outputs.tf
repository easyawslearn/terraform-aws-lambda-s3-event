output "lambda_function_arn" {
  value = "${aws_lambda_function.lambda_function.arn}"
}

output "lambda_function_name" {
  value = "${aws_lambda_function.lambda_function.function_name}"
}

output "s3_bucket_name" {
  value = "${aws_s3_bucket.lambda_trigger_bucket.id}"
}

output "s3_bucket_arn" {
  value = "${aws_s3_bucket.lambda_trigger_bucket.arn}"
}

output "role_name" {
  value = "${aws_iam_role.lambda_role.name}"
}

output "role_arn" {
  value = "${aws_iam_role.lambda_role.arn}"
}
