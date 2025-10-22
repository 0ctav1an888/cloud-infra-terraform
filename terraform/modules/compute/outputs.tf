output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.this.id
}

output "instance_arn" {
  description = "ARN of the EC2 instance"
  value       = aws_instance.this.arn
}

output "private_ip" {
  description = "Private IP address"
  value       = aws_instance.this.private_ip
}

output "public_ip" {
  description = "Public IP address"
  value       = aws_instance.this.public_ip
}

output "availability_zone" {
  description = "Availability zone"
  value       = aws_instance.this.availability_zone
}

output "subnet_id" {
  description = "Subnet ID"
  value       = aws_instance.this.subnet_id
}

output "security_group_ids" {
  description = "Security group IDs"
  value       = aws_instance.this.vpc_security_group_ids
}

output "instance_state" {
  description = "Instance state"
  value       = aws_instance.this.instance_state
}

output "primary_network_interface_id" {
  description = "Primary network interface ID"
  value       = aws_instance.this.primary_network_interface_id
}

output "instance_type" {
  description = "Instance type"
  value       = aws_instance.this.instance_type
}

output "key_name" {
  description = "SSH key pair name"
  value       = aws_instance.this.key_name
}
