output "terraform_config" {
  description = "Terraform excerpt with state backend configuration. Can be used in multi-environments terraform code."

  value = <<EOF

# paste the following into main.tf
terraform {
  backend "s3" {
    bucket         = "${aws_s3_bucket.tfstate.id}"
    key            = "terraform"
    region         = "${var.region}"
    dynamodb_table = "${aws_dynamodb_table.tfstate.id}"
  }
}

EOF
}

output "bucket_name" {
  description = "S3 bucket name that has been created"
  value = "${aws_s3_bucket.tfstate.id}"
}
