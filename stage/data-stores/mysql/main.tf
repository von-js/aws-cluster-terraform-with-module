provider "aws" {
  region = "ap-southeast-1"
}
terraform {
  backend "s3" {
    bucket = "von-tfstate"
    key    = "stage/data-store/mysql/terraform.tfstate"
    region = "ap-southeast-1"

    dynamodb_table = "tfstate-lock"
    encrypt        = true
  }
}

resource "aws_db_instance" "terraform" {
  identifier_prefix   = "terraform-example"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"

  username            = "admin"

  name                = var.db_name
  skip_final_snapshot = true

  password            = var.db_password
}


