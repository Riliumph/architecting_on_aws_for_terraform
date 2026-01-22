# NAT-GWについて記述する。

# NAT-GWに付与するIPアドレス
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${var.pj}-nat-eip"
  }
}

# nat gatewayはpublic subnetに配置する。
# subnet.tfのaws_subnetクラスのpublicインスタンスを参照
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = values(aws_subnet.public)[0].id

  tags = {
    Name = "${var.pj}-nat"
  }
}
