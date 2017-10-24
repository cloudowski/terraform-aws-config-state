# terraform-aws-config-state
This terraform code creates state backend using AWS S3 bucket and DynamoDB table (described [here](https://www.terraform.io/docs/backends/types/s3.html)). It is very handy when working with multiple environments/[workspaces](https://www.terraform.io/docs/state/workspaces.html) in a team.

# Usage

## Configuration
Set the following variables if you want to customize it:

  * **region** - region where to deploy resources (*us-east-1* by default)
  * **bucket_name** - s3 bucket name (*tfstate* by default)
  * **bucket_versioning** - controls s3 bucket versioning (*false* by default)
  * **dynamodb_table_name** - dynamodb table name (*tfstate* by default)

Also prepare your AWS configuration (proper credentials) or adjust **provider** config section.

## Applying
Apply code to create resources

```
terraform apply
```

In outputs there is **terraform_config** with generated terraform configuration you can use in your work with multiple environments using workspaces (with locking!)

You can paste it directly into new terraform code where you want to start using multiple workspaces:

```
terraform output terraform_config > tfstate.tf
```

Then follow [documentation](https://www.terraform.io/docs/state/workspaces.html) on how to use workspaces and leverage it when dealing with multiple environments and many people working with code.


# S3 bucket name caveat
Because of the fact that **all** AWS S3 bucket names are **global**, a random suffix is created during deployment and appended to provided bucket name to avoid naming conflicts.
