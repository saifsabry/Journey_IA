output "group_arns" {
  description = "A map of IAM group names to their ARNs."
  value       = { for name, group in aws_iam_group.this : name => group.arn }
}

output "group_names" {
  description = "A map of IAM group names to their names."
  value       = { for name, group in aws_iam_group.this : name => group.name }
}