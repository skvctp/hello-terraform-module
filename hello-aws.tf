// This is an AWS provider block
provider "aws" {
  region = "us-east-1"
}

// This is an AWS resource block that creates an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.${var.size}"

  tags = {
    User = "${var.user_id}"
    Repository = "github.com/cloudtp/hello-terraform-module"
  }
}
