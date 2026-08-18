app_name = "reshma-app"

# Dockerfile.server listens on 4000. This value is used by the ECS port
# mapping, ALB target group, and ECS service attachment.
container_port    = 4000
target_group_port = 4000
health_check_path = "/reshma/health"

listener_priority = 103

path_pattern = "/reshma/*"
