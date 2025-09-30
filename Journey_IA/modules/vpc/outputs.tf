output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.main.id
}

output "default_network_acl_id" {
  description = "The ID of the default network ACL."
  value       = aws_vpc.main.default_network_acl_id
}