# Reshma ECS backend infrastructure

This Terraform configuration deploys the backend API as a single Fargate
container behind the shared ALB. The application image must listen on the same
port configured by `container_port`; the current server image listens on
`4000`, so the target group, ECS port mapping, and ECS service attachment all
use port `4000`.

The ALB listener forwards `/reshma/*` to this backend target group. The health
check calls `/reshma/health` on port `4000` and expects a `200`–`399` response.
Terraform also permits inbound TCP `4000` to the ECS task security group only
from the shared ALB's security group.

## Deploy

Build and push the backend image to the `reshma-app` ECR repository with the
tag selected by `image_tag` (default: `latest`), then run:

```sh
terraform init
terraform plan
terraform apply
```

## Frontend

This project does not deploy the React application. A browser request to
`/reshma/*` is currently routed to the API container and will only work for API
routes the server handles.

To publish the full web app, extend the task definition with a frontend nginx
container and a frontend image. Route the ALB to nginx on port `80`, and have
nginx proxy API requests to the backend container on port `4000`. That change
also needs the frontend Dockerfile/nginx configuration and the image build and
push workflow, none of which are present in this repository.
updated