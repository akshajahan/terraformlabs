

#Add resource block with required attributes
resource "aws_instance" "webserver" {
  ami = "ami-01aab85a5e4a5a0fe"
  instance_type = "t2.micro"
    
    provisioner "local-exec" {
        command = "echo ${self.private_ip} > file.txt"
    }
}