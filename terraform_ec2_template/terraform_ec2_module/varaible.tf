variable "instance_type" {
  default = "t2.micro"
  description = "This is the instance type"
}

variable "subnet_id" {
  description = "The subnet id for instance creation"
}

# Add more variable based on need / requirement