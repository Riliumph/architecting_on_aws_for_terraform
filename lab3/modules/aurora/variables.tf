variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

output "aurora_writer_instance_id" {
  value = aws_rds_cluster_instance.writer.id
}
