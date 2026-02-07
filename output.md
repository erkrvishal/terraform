# Working with Outputs

## Introduction
Outputs are a way to expose data about your resources and modules.

Outputs are defined using an ***output*** block in your configuration files (often placed in a dedicated ***outputs.tf*** file). The only required argument is ***value***.

## Step-by-Step Guide

1. Create a new folder ***output*** and create a ***main.tf*** new file inside the ***output*** folder.
2. write the ***provider***, ***resource*** and ***data*** block for ***EC2*** (**Below code are for refrence**). \
``` Note - Replace empty string with your access_key and secret_key ```

```
provider "aws" {
  region     = "us-east-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "demo_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

```
3. create an ***output.tf*** file to keep all the output together for a specific project as per below syntax.

```
output "instance_id" {
  value = aws_instance.demo_instance.id
}
```
4. Go to terminal of visual studio code and run the command - ``` cd output ```.
5. Run the command ``` terraform init ``` in order to initialize your project.
6. Run ```terraform plan``` command to validate the terraform resource creation.
7. Once ``` terraform plan ``` succedes run the ``` terraform apply -auto-approve ``` to create the resources in AWS environment.
8. Once the resource created you will see the instance id populated which has been created using the above code, which can be utilised further.