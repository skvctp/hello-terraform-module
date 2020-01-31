// This is an AWS provider block
provider "aws" {
    region = "us-east-1"
}


////////////////////////////////////////////////////////////////////////////////
// This queries AMIs that match the given criteria below. It is a more
// advanced concept, so you can safely ignore it during Lab 1.
//
// The AMI can also be queried manually by running:
// $ aws ec2 describe-images --owners self amazon --filters "Name=virtualization-type,Values=hvm" "Name=name,Values=amzn-ami-hvm-*" --query 'reverse(sort_by(Images, &CreationDate))[:1].ImageId' --output tetx
////////////////////////////////////////////////////////////////////////////////
data "aws_ami" "amazon_linux_latest" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

