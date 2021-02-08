
module "devinstance" {
    source = "../modules/ec2instance"
    ami = "ami-047a51fa27710816e"
    region = "us-east-1"
}

