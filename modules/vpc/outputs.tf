output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.niranjan_vpc.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private.id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT gateway"
  value       = aws_nat_gateway.niranjan_nat_gateway.id
}
