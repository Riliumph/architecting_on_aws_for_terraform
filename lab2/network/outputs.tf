output "vpc_id" {
  value = aws_vpc.this.id
}

# {"public_a": object_id}のマップ構造を構築
output "public_subnet_ids" {
  # Pythonだと下記の意味
  # for k, v in map: new_map[k] = v.id
  value = { for k, v in aws_subnet.public : k => v.id }
}

output "private_subnet_ids" {
  value = { for k, v in aws_subnet.private : k => v.id }
}
