# Application Load Balancer Module

Creates AWS Application Load Balancer with target groups, listeners, and health checks.

## Features

- Application Load Balancer (Layer 7)
- Target group with health checks
- HTTP/HTTPS listener support
- Automatic target registration
- Configurable health check parameters
- Cross-zone load balancing

## Usage

```hcl
module "alb" {
  source          = "../../modules/alb"
  name            = "web-alb"
  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnet_ids
  security_groups = [module.alb_sg.security_group_id]

  target_ids      = [module.web_server.instance_id]
  target_port     = 80
  listener_port   = 80

  health_check_path     = "/health"
  health_check_interval = 30

  tags = {
    Environment = "production"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | ALB name | string | - | yes |
| vpc_id | VPC ID | string | - | yes |
| subnets | Subnet IDs (min 2) | list(string) | - | yes |
| security_groups | Security group IDs | list(string) | - | yes |
| internal | Internal ALB | bool | false | no |
| target_ids | Target instance IDs | list(string) | [] | no |
| target_port | Target port | number | 80 | no |
| target_protocol | Target protocol | string | HTTP | no |
| listener_port | Listener port | number | 80 | no |
| listener_protocol | Listener protocol | string | HTTP | no |
| health_check_* | Health check settings | various | see below | no |
| tags | Resource tags | map(string) | {} | no |

## Health Check Defaults

- **Path**: /
- **Interval**: 30 seconds
- **Timeout**: 5 seconds
- **Healthy threshold**: 3
- **Unhealthy threshold**: 2
- **Matcher**: 200

## Outputs

| Name | Description |
|------|-------------|
| alb_id | ALB ID |
| alb_arn | ALB ARN |
| alb_dns_name | ALB DNS name |
| alb_zone_id | ALB hosted zone ID |
| target_group_arn | Target group ARN |
| listener_arn | Listener ARN |

## Notes

- Requires at least 2 subnets in different availability zones
- Targets are automatically registered to target group
- ALB DNS name can be used with Route53 or accessed directly
- Security groups must allow inbound traffic on listener port
