// This is an AWS provider block
provider "aws" {
  region = "us-east-1"
}
module "ami_module" {
  source = "./ami_module"
}

locals {
  tags = {
    Name = var.Name
    ResourceOwner = var.user_id
    BusinessUnit = var.BusinessUnit != "" ? var.BusinessUnit : "CTP-ENG-LAB"
    EndDate = var.EndDate != "" ? var.EndDate : timeadd(timestamp(), "240h")
    User = var.user_id
  }
}

// This is an AWS resource block that creates an EC2 instance
resource "aws_instance" "example" {
  ami           = var.ami
  associate_public_ip_address = true
  instance_type = "t2.${var.size}"
  tags        = local.tags
  volume_tags = local.tags
}
