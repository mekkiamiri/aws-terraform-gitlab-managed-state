terraform {
  backend "http" {
  }
}

provider "aws" {
  region = "eu-west-3"
}

resource "aws_s3_bucket" "storageTest" {
  bucket = "tf-bucket-storage-test-state"
}