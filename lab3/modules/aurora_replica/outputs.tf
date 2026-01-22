output "cluster_arn" {
  value = aws_rds_cluster.this.arn
}

output "reader_endpoint" {
  value = aws_rds_cluster.this.reader_endpoint
}
