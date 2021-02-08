resource "local_file" "ec2out" {
  filename = "webserver.txt"
  content = <<-EOF
    public ip of webserver is ${aws_instance.webserver.public_ip}
    private ${aws_instance.webserver.private_ip}
    connected to subnet id ${aws_instance.webserver.subnet_id}
    web server current status is ${aws_instance.webserver.instance_state}
  EOF
}