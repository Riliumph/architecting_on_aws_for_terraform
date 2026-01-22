resource "aws_instance" "public" {
  ami           = data.aws_ssm_parameter.amazon_linux_2023.value
  instance_type = "t3.micro"
  subnet_id     = var.subnet["public_a"]

  tags = {
    Name = "${var.pj}-pub-ec2-bation"
  }
}
