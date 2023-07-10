terraform {
  backend "http" {
  }
}

provider "aws" {
  region = "eu-west-3"
}

resource "aws_instance" "instanceTest" {
  ami           = "ami-019fba393241c7429"
  instance_type = "t2.micro"

  tags = {
    Name = "FirstInstance"
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.instanceTest.id
  domain   = "vpc"
}