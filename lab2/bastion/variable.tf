# VPC名前空間

variable "pj" {
  type = string
}

variable "region" {
  type = string
}

# RESOURCE用

variable "vpc_id" {
  type = string
}

variable "ssm_ami" {
  type    = string
  default = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

variable "subnet" {
  type = map(string)
}

variable "allowed_sg_id" {
  type = string
}
