## COMMON

variable "pj" {
  type    = string
  default = "lab2"

}

variable "owner_name" {
  type    = string
  default = "lab2"
}

variable "region" {
  type    = string
  default = "ap-northeast-1"
}

## NETWORK

# VPC
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

# Subnet
# CIDRとの関係性を管理するためMAPで定義
variable "subnet" {
  type = map(object({
    az   = string
    cidr = string
  }))
  default = {
    public_a = {
      az   = "a"
      cidr = "10.0.10.0/24"
    }
    private_a = {
      az   = "a"
      cidr = "10.0.11.0/24"
    }
    public_c = {
      az   = "c"
      cidr = "10.0.20.0/24"
    }
    private_c = {
      az   = "c"
      cidr = "10.0.21.0/24"
    }
  }
}

## SERVER
# EC2
variable "ami_id" {
  description = "ap-northeast-1 の Amazon Linux 2023"
  type        = string
  default     = "ami-0f9c1f1f3b8d4f0a3"
}
