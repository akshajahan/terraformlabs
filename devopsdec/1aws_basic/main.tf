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

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
  access_key = "AKIAS5NSTECV2Z35NDIR"
  secret_key = "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"
}

#Add resource block with required attributes
resource "aws_instance" "webserver" {
  ami = "ami-01aab85a5e4a5a0fe"
  instance_type = "t2.micro"
  
}

# tags = {
#     "Name" = "tfvm"
#   }