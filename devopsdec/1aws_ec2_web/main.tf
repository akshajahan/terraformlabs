terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

variable "awskey" {
  
}

variable "awssecret" {

}

variable "region" {
  default = "us-east-2"
}

variable "ami_id" {
    default = "ami-01aab85a5e4a5a0fe"
}

variable "amitag" {
  
}

# Configure the AWS Provider
provider "aws" {
  region = "${var.region}"
  access_key = "${var.awskey}"
  secret_key = "${var.secret}"
}
#create new EC2 instance as web server
resource "aws_instance" "webserver" {
  ami           = "${var.ami_id}"
  instance_type = "t2.micro"
  key_name      = "tfkp1"
  
  user_data = <<-EOF
      #!/bin/bash
      sudo yum install httpd -y
      sudo systemctl enable httpd
      sudo systemctl start httpd
      sudo echo welcome to web server in aws apache2 > /var/www/html/index.html
   EOF
   
  tags = {
    Name = "${var.amitag}"
  }
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