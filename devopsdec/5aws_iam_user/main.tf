terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
  access_key = "yourkey"
  secret_key = "yoursecret"
}

variable "user" {
}

resource "aws_iam_user" "teamlead" {
  name = "${var.user}"
  tags = {
    "description" = "Technical team lead"
  }
}

