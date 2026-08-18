app_name = "reshma-app"

# Dockerfile.server listens on 4000. This value is used by the ECS port
# mapping, ALB target group, and ECS service attachment.
container_port = 4000

listener_priority = 103

path_pattern = "/reshma/*"
