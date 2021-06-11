terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }

  required_version = ">= 0.14.9"

  backend "s3" {
    bucket = "charles-cool-tf-bucket-remote-backend"
    key    = "example-terraform-with-s3-backend.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0ee02acd56a52998e"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
