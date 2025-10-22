# VPC Module

Creates a complete AWS VPC with public, private, management, and optional guest Wi-Fi subnets.

## Features

- VPC with configurable CIDR block
- Public subnets with Internet Gateway
- Private subnets with optional NAT Gateway
- Management subnet for administrative access
- Optional Guest Wi-Fi subnet with isolated routing
- Configurable availability zones
- Automatic route table management

## Usage

```hcl
module "vpc" {
  source            = "../../modules/vpc"
  name              = "my-vpc"
  cidr              = "10.0.0.0/16"
  public_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets   = ["10.0.10.0/24", "10.0.11.0/24"]
  management_subnet = "10.0.254.0/24"
  guest_subnet      = "10.0.30.0/24"
  azs               = ["eu-west-2a", "eu-west-2b"]
  enable_nat        = true
  tags              = {
    Environment = "production"
    Project     = "my-project"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | VPC name prefix | string | - | yes |
| cidr | VPC CIDR block | string | - | yes |
| public_subnets | List of public subnet CIDRs | list(string) | [] | no |
| private_subnets | List of private subnet CIDRs | list(string) | [] | no |
| management_subnet | Management subnet CIDR | string | - | yes |
| guest_subnet | Guest Wi-Fi subnet CIDR | string | "" | no |
| azs | Availability zones | list(string) | [] | no |
| enable_nat | Create NAT Gateway | bool | false | no |
| tags | Resource tags | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | VPC ID |
| public_subnet_ids | List of public subnet IDs |
| private_subnet_ids | List of private subnet IDs |
| management_subnet_id | Management subnet ID |
| guest_subnet_id | Guest Wi-Fi subnet ID |
| private_route_table_id | Private route table ID |
| public_route_table_id | Public route table ID |

## Subnet Architecture

- **Public Subnets**: Internet-facing, routes to Internet Gateway
- **Private Subnets**: Internal resources, routes through NAT Gateway
- **Management Subnet**: Administrative access, isolated routing
- **Guest Subnet**: Isolated Wi-Fi, internet-only access

## Notes

- NAT Gateway is optional but recommended for private subnet internet access
- Guest subnet is completely isolated from private and management subnets
- All subnets distributed across specified availability zones
