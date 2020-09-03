provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "ope-tf-bucket-0309"
    key    = "terraform.tfstate"
    region = "eu-west-2"
    # dynamodb_table = "ope-tf-lock-table"
  }
}
