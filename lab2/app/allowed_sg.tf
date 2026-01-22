
# APPが許可するSG
# APPにアクセスする他のリソースが設定する。
# Outputs.tfで外部に共有される。
resource "aws_security_group" "allowed_sg" {
  name        = "public-sg"
  description = "Allow inbound SSH from anywhere"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
