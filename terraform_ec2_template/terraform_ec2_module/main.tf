provider "aws" {
  region     = "" # Pass the region you want to create infrastructure in.
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

  owners = [""] # Canonical account number, can be found in aws console, ami section
}

module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.2.0" #Verify the version in terraform registry

  name = "" # Name of the ec2 instance you want to keep
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  create_security_group = false # True if you want to create the security group
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}