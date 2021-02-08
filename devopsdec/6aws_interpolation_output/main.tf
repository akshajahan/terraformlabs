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
  access_key = "yourkey"
  secret_key = "yoursecret"
}

#Add resource block with required attributes
resource "aws_instance" "webserver" {
  ami = "ami-01aab85a5e4a5a0fe"
  instance_type = "t2.micro"
  
}

resource "local_file" "ec2out" {
  filename = "webserver.txt"
  content = <<-EOF
    public ip of webserver is ${aws_instance.webserver.public_ip}
    private ${aws_instance.webserver.private_ip}
    connected to subnet id ${aws_instance.webserver.subnet_id}
    web server current status is ${aws_instance.webserver.instance_state}
  EOF
}

# tags = {
#     "Name" = "tfvm"
#   }