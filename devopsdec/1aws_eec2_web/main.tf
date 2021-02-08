
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