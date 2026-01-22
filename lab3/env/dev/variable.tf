variable "owner_name" {
  type    = string
  default = "lab3"
}

variable "primary_region" {
  type    = string
  default = "ap-northeast-1"
}

variable "replica_region" {
  type    = string
  default = "ap-northeast-3"
}

variable "primary_azs" {
  type    = list(string)
  default = ["a", "c"]
}

variable "replica_azs" {
  type    = list(string)
  default = ["a", "b"]
}
