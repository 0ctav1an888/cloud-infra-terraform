# Security Group Module

Creates AWS security groups with dynamic ingress and egress rules.

## Features

- Dynamic security group creation
- Flexible ingress/egress rules
- CIDR block and security group source support
- Rule descriptions for documentation
- Comprehensive tagging

## Usage

```hcl
module "web_sg" {
  source      = "../../modules/security_group"
  name        = "web-server-sg"
  description = "Security group for web servers"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTP from internet"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTPS from internet"
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound"
    }
  ]

  tags = {
    Environment = "production"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | Security group name | string | - | yes |
| description | Security group description | string | - | yes |
| vpc_id | VPC ID | string | - | yes |
| ingress_rules | Ingress rules | list(object) | [] | no |
| egress_rules | Egress rules | list(object) | [] | no |
| tags | Resource tags | map(string) | {} | no |

## Rule Object Structure

```hcl
{
  from_port       = number
  to_port         = number
  protocol        = string
  cidr_blocks     = list(string)     # optional
  security_groups = list(string)     # optional
  description     = string           # optional
}
```

## Outputs

| Name | Description |
|------|-------------|
| security_group_id | Security group ID |
| security_group_name | Security group name |
| security_group_arn | Security group ARN |

## Common Protocols

- TCP: "tcp"
- UDP: "udp"
- ICMP: "icmp"
- All: "-1"

## Notes

- Either cidr_blocks or security_groups must be specified for each rule
- Protocol "-1" allows all protocols
- Port 0 with protocol "-1" allows all ports
