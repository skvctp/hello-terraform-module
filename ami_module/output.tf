output "aws_ami_id" {
  value = "${data.aws_ami.amazon_linux_latest.id}"
}
