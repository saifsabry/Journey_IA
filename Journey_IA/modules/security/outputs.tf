output "default_security_group_id" {
  description = "The ID of the default security group."
  value       = aws_default_security_group.default.id
}

output "lb_security_group_id" {
  description = "The ID of the Load Balancer security group."
  value       = aws_security_group.oj_ecs_lb.id
}

output "ecs_service_security_group_id" {
  description = "The ID of the ECS Service security group."
  value       = aws_security_group.oj_ecs_service.id
}

output "global_accelerator_security_group_id" {
  description = "The ID of the Global Accelerator security group."
  value       = aws_security_group.global_accelerator.id
}