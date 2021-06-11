terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_kms_key" "charleskey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
  tags = {
    Name        = "Charles is Cool Key"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "charles-cool-tf-bucket-remote-backend"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.charleskey.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
  tags = {
    Name        = "Bucket for backend Terraform remote state POC trial"
    Environment = "Dev"
  }
}
