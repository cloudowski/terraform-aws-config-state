variable "region" {
  description = "The region where to create backend resources"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the bucket for terraform state"
  default     = "tfstate"
}

variable "dynamodb_table_name" {
  description = "Name of dynamodb table for terraform state"
  default     = "tfstate"
}
