output "lambda_function_arn" {
  value = "${aws_lambda_function.lambda_function.arn}"
}

output "lambda_function_name" {
  value = "${aws_lambda_function.lambda_function.function_name}"
}

output "role_name" {
  value = "${aws_iam_role.lambda_role.name}"
}

output "s3" {
  value = "${element(concat(aws_s3_bucket.lambda_trigger_bucket.*.id, list("")), 0)}"
}

output "role_arn" {
  value = "${aws_iam_role.lambda_role.arn}"
}
