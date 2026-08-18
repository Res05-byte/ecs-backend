########################################
# Outputs
########################################

output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}

output "ecs_service_name" {
  value = aws_ecs_service.app.name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.app.arn
}

output "application_url" {
  description = "Browser URL for the application; listener wildcards are not part of URLs."
  value       = "http://${data.aws_lb.platform.dns_name}${trimsuffix(var.path_pattern, "*")}"
}
