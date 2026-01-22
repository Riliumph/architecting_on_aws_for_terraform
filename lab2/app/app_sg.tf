# APPのSG
resource "aws_security_group" "private_sg" {
  name        = "private-sg"
  description = "Allow access only from public EC2 SG"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow traffic from public SG"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.allowed_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
