provider "aws" {
  profile = "default"
  region  = "${var.region}"
}

resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"

  security_groups = ["HHITUSSH"]

  key_name = "Devops2"

  tags {
    Name = "example 1"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}
