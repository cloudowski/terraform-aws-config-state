provider "aws" {
  region = "${var.region}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "tfstate" {
  bucket = "${var.bucket_name}-${random_string.suffix.result}"
  acl    = "private"

  versioning {
    enabled = "${var.bucket_versioning}"
  }
}

resource "aws_dynamodb_table" "tfstate" {
  name           = "${var.dynamodb_table_name}"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
