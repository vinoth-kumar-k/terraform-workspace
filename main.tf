provider "aws" {
  profile = "default"
  region  = "${var.region}"
}

resource "aws_instance" "example" {
  ami             = "ami-2757f631"
  instance_type   = "t2.micro"

  tags {
    Name = "earth"
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

output "ip" {
  value = "${aws_instance.example.public_ip}"
}
