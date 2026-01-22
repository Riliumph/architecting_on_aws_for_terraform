# サブネット
locals {
  public_subnets = {
    for key, val in var.subnet :
    key => val if startswith(key, "public_")
  }
}

## Public Subnet

resource "aws_subnet" "public" {
  # リソースをmap型に変換
  for_each = local.public_subnets

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr
  availability_zone = "${var.region}${each.value.az}"

  tags = {
    Name = "${var.pj}-pub-${each.value.az}-subnet"
    Key  = "${each.key}"
  }
}

## Route Table

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.pj}-pub-rt"
  }
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}
