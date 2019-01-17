output "table_id" {
  value = "${aws_dynamodb_table.default.id}"
}

output "table_arn" {
  value = "${aws_dynamodb_table.default.arn}"
}

output "table_name" {
  value = "${aws_dynamodb_table.default.name}"
}

output "readpolicy" {
  value = "${aws_iam_policy.readpolicy.arn}"
}

output "writepolicy" {
  value = "${aws_iam_policy.writepolicy.arn}"
}
