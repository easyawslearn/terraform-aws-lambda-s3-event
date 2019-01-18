# Terraform Lambda Function Module


## Overview

Terraform  lambda module to configure an lambda function.

This module in the application's terraform/main.tf file with the necessary parameters.


## Variables

**app_name**: (String) the name of the application naming the resources

**owner** (String) The team that owns the application

**region** (String) The region where you want to deploy the application

**lambda_runtime** (String) Lambda function run environment base

**lambda_memory_size** (String) Lambda function allocated memory size

**filtersuffix** (String) Lambda function invoke suffix for S3 Objecy Create or put

**filterprefix** (String) Lambda function invoke prefix for S3 Objecy Create or put

**lambda_timeout** (String) Lambda function timeout configuration

**lambda_handler** (String) Lambda function handler name

**lambda_source_package** (String) Lambda function source file name with location


## Outputs

**lambda_function_arn**: The ARN for the created Amazon Lambda Function

**lambda_function_name**: The Name for the created Amazon Lambda Function

**s3_bucket_name**: S3 bucket name where you want to crate notification event

**s3_bucket_arn**: ARN for s3 bucket

**role_name**: name for a IAM role created withing lambda Function access

**role_arn**: ARN for a IAM role created withing lambda Function access



## Example

####application/terraform/main.tf

~~~~
module "My_lambda_Function" {
  source            = "git::ssh://git@github.com:Patelvijaykumar/terraform-lambda.git"
  app_name          = "my-service-custom"
  owner             = "my-group"
}
~~~~

