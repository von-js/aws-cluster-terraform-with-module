# Set up provider
provider "aws" {
  region = var.region
}
# Backend storage for terraform state files
terraform {
  backend "s3" {
    bucket = "von-tfstate"
    key    = "global/s3/terraform.tfstate"
    region = "ap-southeast-1"

    dynamodb_table = "tfstate-lock"
    encrypt        = true
  }
}
resource "aws_s3_bucket" "terraform_state" {
  bucket        = var.bucket_name
  force_destroy = true

  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
 
}

resource "aws_dynamodb_table" "tfstate_locks" {
  name         = var.db_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
