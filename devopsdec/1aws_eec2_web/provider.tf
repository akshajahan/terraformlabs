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
  region = "${var.region}"
  access_key = "${var.awskey}"
  secret_key = "${var.secret}"
}