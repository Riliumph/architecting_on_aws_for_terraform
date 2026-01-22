resource "aws_instance" "private" {
  ami           = data.aws_ssm_parameter.amazon_linux_2023.value
  instance_type = "t3.micro"
  subnet_id     = var.subnet["private_a"]

  tags = {
    Name = "${var.pj}-pri-ec2-service"
  }
}
