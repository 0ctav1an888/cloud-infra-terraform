# Llanelli Outputs
output "llanelli_vpc_id" {
  description = "Llanelli VPC ID"
  value       = try(module.llanelli.vpc_id, null)
}

output "llanelli_public_subnets_ids" {
  description = "List of Llanelli Public Subnet IDs"
  value       = try(module.llanelli.public_subnet_ids, [])
}

output "llanelli_private_subnet_ids" {
  description = "List of Llanelli Private Subnet IDS"
  value       = try(module.llanelli.private_subnet_ids, [])
}

output "llanelli_management_subnet_ids" {
  description = "Llanelli Management Subnet ID"
  value       = try(module.llanelli.management_subnet_id, null)
}

# Cardiff Outputs

output "cardiff_vpc_id" {
  description = "cardiff VPC ID"
  value       = try(module.cardiff.vpc_id, null)
}

output "cardiff_public_subnets_ids" {
  description = "List of cardiff Public Subnet IDs"
  value       = try(module.cardiff.public_subnet_ids, [])
}

output "cardiff_private_subnet_ids" {
  description = "List of cardiff Private Subnet IDS"
  value       = try(module.cardiff.private_subnet_ids, [])
}

output "cardiff_management_subnet_ids" {
  description = "cardiff Management Subnet ID"
  value       = try(module.cardiff.management_subnet_id, null)
}

# Llanelli Compute Outputs

output "llanelli_file_server_id" {
  description = "Llanelli file server instance ID"
  value       = module.llanelli_file_server.instance_id
}

output "llanelli_file_server_private_ip" {
  description = "Llanelli file server private IP"
  value       = module.llanelli_file_server.private_ip
}

output "llanelli_developer_server_id" {
  description = "Llanelli developer server instance ID"
  value       = module.llanelli_developer_server.instance_id
}

output "llanelli_developer_server_private_ip" {
  description = "Llanelli developer server private IP"
  value       = module.llanelli_developer_server.private_ip
}

output "llanelli_web_server_id" {
  description = "Llanelli web server instance ID"
  value       = module.llanelli_web_server.instance_id
}

output "llanelli_web_server_private_ip" {
  description = "Llanelli web server private IP"
  value       = module.llanelli_web_server.private_ip
}

output "llanelli_web_server_public_ip" {
  description = "Llanelli web server public IP"
  value       = module.llanelli_web_server.public_ip
}

output "llanelli_dhcp_server_id" {
  description = "Llanelli DHCP server instance ID"
  value       = module.llanelli_dhcp_server.instance_id
}

output "llanelli_dhcp_server_private_ip" {
  description = "Llanelli DHCP server private IP"
  value       = module.llanelli_dhcp_server.private_ip
}

# Cardiff Compute Outputs

output "cardiff_backup_server_id" {
  description = "Cardiff backup server instance ID"
  value       = module.cardiff_backup_server.instance_id
}

output "cardiff_backup_server_private_ip" {
  description = "Cardiff backup server private IP"
  value       = module.cardiff_backup_server.private_ip
}

output "cardiff_email_server_id" {
  description = "Cardiff email server instance ID"
  value       = module.cardiff_email_server.instance_id
}

output "cardiff_email_server_private_ip" {
  description = "Cardiff email server private IP"
  value       = module.cardiff_email_server.private_ip
}

output "cardiff_security_server_id" {
  description = "Cardiff security server instance ID"
  value       = module.cardiff_security_server.instance_id
}

output "cardiff_security_server_private_ip" {
  description = "Cardiff security server private IP"
  value       = module.cardiff_security_server.private_ip
}

output "cardiff_dhcp_server_id" {
  description = "Cardiff DHCP server instance ID"
  value       = module.cardiff_dhcp_server.instance_id
}

output "cardiff_dhcp_server_private_ip" {
  description = "Cardiff DHCP server private IP"
  value       = module.cardiff_dhcp_server.private_ip
}

# ALB Outputs

output "llanelli_alb_dns_name" {
  description = "Llanelli ALB DNS name"
  value       = module.llanelli_alb.alb_dns_name
}

output "llanelli_alb_arn" {
  description = "Llanelli ALB ARN"
  value       = module.llanelli_alb.alb_arn
}

output "llanelli_alb_target_group_arn" {
  description = "Llanelli ALB target group ARN"
  value       = module.llanelli_alb.target_group_arn
}