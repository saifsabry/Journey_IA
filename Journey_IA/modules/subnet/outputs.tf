output "subnet_ids" {
  description = "A map of subnet names to their respective IDs."
  value       = { for name, subnet in aws_subnet.this : name => subnet.id }
}