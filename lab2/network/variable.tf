# VPC名前空間

variable "pj" {
  type = string
}

variable "region" {
  type = string
}

# RESOURCE用

variable "vpc_cidr" {
  type = string
}

variable "subnet" {
  type = map(object({
    az   = string
    cidr = string
  }))
}
