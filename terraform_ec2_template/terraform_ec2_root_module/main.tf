provider "aws" {
  region     = var.aws_region # Pass the region you want to create infrastructure in default is us-east-1.
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = [""] # Pass the name expression for the ami, which should be used to create an instance
  }
  

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [""] # # Canonical account number, can be found in aws console, ami section
}

resource "aws_instance" "demo_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = "HelloWorld"
  }
}