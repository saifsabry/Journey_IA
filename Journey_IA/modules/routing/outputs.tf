output "route_table_id" {
  description = "The ID of the main route table."
  value       = aws_route_table.this.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.this.id
}