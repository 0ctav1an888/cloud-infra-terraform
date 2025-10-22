# Compute Module

Deploys AWS EC2 instances with configurable settings for application servers.

## Features

- Single EC2 instance deployment
- Configurable instance type and AMI
- Optional public IP association
- Security group attachment
- Optional IAM instance profile
- Optional SSH key pair
- Optional user data script
- Encrypted root volumes
- Comprehensive tagging

## Usage

```hcl
module "web_server" {
  source              = "../../modules/compute"
  name                = "web-server"
  ami                 = "ami-0c1c30571d2dae5c9"
  instance_type       = "t3.micro"
  subnet_id           = module.vpc.public_subnet_ids[0]
  associate_public_ip = true
  key_name            = "my-ssh-key"
  security_group_ids  = [module.sg_web.security_group_id]
  root_volume_size    = 30
  monitoring          = true
  tags = {
    Role        = "web-server"
    Environment = "production"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | Instance name | string | - | yes |
| ami | AMI ID | string | - | yes |
| instance_type | Instance type | string | t3.micro | no |
| subnet_id | Subnet ID | string | - | yes |
| associate_public_ip | Associate public IP | bool | false | no |
| key_name | SSH key pair name | string | "" | no |
| security_group_ids | Security group IDs | list(string) | [] | no |
| iam_instance_profile | IAM instance profile | string | "" | no |
| user_data | User data script | string | "" | no |
| root_volume_size | Root volume size (GB) | number | 20 | no |
| root_volume_type | Root volume type | string | gp3 | no |
| monitoring | Detailed monitoring | bool | false | no |
| tags | Resource tags | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| instance_id | EC2 instance ID |
| instance_arn | Instance ARN |
| private_ip | Private IP address |
| public_ip | Public IP address |
| availability_zone | Availability zone |
| subnet_id | Subnet ID |
| instance_state | Instance state |

## Security

- Root volumes encrypted by default
- Security groups control network access
- Optional SSH key for secure access
- IAM roles for AWS service access

## Notes

- Root volume is EBS encrypted by default
- Public IP only assigned if explicitly enabled
- User data scripts run on first boot only
