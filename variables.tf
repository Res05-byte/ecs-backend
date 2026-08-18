variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "cluster_name" {
  type    = string
  default = "concproject-cluster"
}

variable "alb_name" {
  type    = string
  default = "concproject-alb"
}

variable "app_name" {
  type = string
}

variable "container_port" {
  type        = number
  description = "Port exposed by the application container and ECS service."
}

variable "target_group_port" {
  type        = number
  description = "Port on which the ALB target group reaches registered ECS tasks."
}

variable "health_check_path" {
  type        = string
  description = "HTTP path the ALB calls to determine ECS target health."
}

variable "task_cpu" {
  type    = string
  default = "256"
}

variable "task_memory" {
  type    = string
  default = "512"
}

variable "image_tag" {
  type    = string
  default = "latest"
}

variable "listener_priority" {
  type = number
}

variable "path_pattern" {
  type = string
}
