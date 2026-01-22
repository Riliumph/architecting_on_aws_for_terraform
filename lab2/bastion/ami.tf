data "aws_ssm_parameter" "amazon_linux_2023" {
  name = var.ssm_ami
}
