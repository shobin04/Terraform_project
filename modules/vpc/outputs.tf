output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "web_tier_subnet_ids" {
  value = aws_subnet.web_tier[*].id
}

output "mobile_tier_subnet_ids" {
  value = aws_subnet.mobile_tier[*].id
}

output "db_tier_subnet_id" {
  value = aws_subnet.db_tier.id
}

output "eks_subnet_ids" {
  value = aws_subnet.eks[*].id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "igw_id" {
  value = aws_internet_gateway.my_igw.id
}

output "public_route_table_id" {
  value = aws_route_table.public_rt.id
}

output "private_route_table_id" {
  value = aws_route_table.private_rt.id
}

output "elasticache_subnet_id" {
  value = aws_subnet.db_tier.id  # Or aws_subnet.web_tier[0].id
}

output "cache_subnet_id" {
  description = "ID of the cache subnet group"
  value       = aws_subnet.cache_subnet.id  # Ensure this resource exists in your VPC module
}

