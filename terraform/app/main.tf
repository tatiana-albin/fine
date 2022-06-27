# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 3.27"
#     }
#   }

#   required_version = ">= 0.14.9"
# }

# provider "aws" {
#   profile = "default"
#   region  = "eu-central-1"
# }

data "aws_vpc" "default" {
  id = "vpc-fac00f90"
}

resource "aws_instance" "app_server" {
  ami           = "ami-09439f09c55136ecf"
  instance_type = "t2.micro"
  key_name      = "pregatit"

  security_groups = [ aws_security_group.allow_ssh.name ]

  tags = {
    Name = "prod-hosting-server"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description      = "SSH from anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Flask access"
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
