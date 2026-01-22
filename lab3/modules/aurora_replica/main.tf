resource "aws_db_subnet_group" "this" {
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "this" {
  vpc_id = var.vpc_id
}

resource "aws_rds_cluster" "this" {
  engine                        = var.aurora_engine
  replication_source_identifier = var.source_cluster_arn

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.this.id]
  skip_final_snapshot    = true

  depends_on = []
}

resource "aws_rds_cluster_instance" "replica" {
  cluster_identifier = aws_rds_cluster.this.id
  instance_class     = "db.t3.medium"
  engine             = aws_rds_cluster.this.engine
}
