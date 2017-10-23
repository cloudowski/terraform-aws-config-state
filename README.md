# terraform-aws-config-state
This terraform code creates state backend using AWS S3 bucket and DynamoDB table.

# Usage
Set the following variables if you want to customize it:

  * **region** - region where to deploy resources (*us-east-1* by default)
  * **bucket_name** - s3 bucket name (*tfstate* by default)
  * **dynamodb_table_name** - dynamodb table name (*tfstate* by default)

Then run

```
terraform apply
```

In outputs there is **terraform_config** with generated terraform configuration you can use in your work with multiple environments using workspaces (with locking!)

# S3 bucket name caveat
Because of the fact that **all** AWS S3 bucket names are **global**, a random suffix is created during deployment and appended to provided bucket name to avoid naming conflicts.
