#AWS cli installed system
#Create AWS credential – programmatic access - portal

#Add terraform block in main.tf file
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

variable "region" {
  #default = "us-east-2"
}

# Configure the AWS Provider
provider "aws" {
  region = "${var.region}"
  access_key = "yourkey"
  secret_key = "yoursecret"
}

#Add resource block with required attributes
resource "aws_instance" "webserver" {
  ami = "ami-01aab85a5e4a5a0fe"
  instance_type = "t2.micro"
}