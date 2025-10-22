output "vpn_gateway_id" {
  description = "VPN gateway ID"
  value       = aws_vpn_gateway.this.id
}

output "customer_gateway_id" {
  description = "Customer gateway ID"
  value       = aws_customer_gateway.this.id
}

output "vpn_connection_id" {
  description = "VPN connection ID"
  value       = aws_vpn_connection.this.id
}

output "vpn_connection_tunnel1_address" {
  description = "VPN connection tunnel 1 address"
  value       = aws_vpn_connection.this.tunnel1_address
}

output "vpn_connection_tunnel1_preshared_key" {
  description = "VPN connection tunnel 1 preshared key"
  value       = aws_vpn_connection.this.tunnel1_preshared_key
  sensitive   = true
}

output "vpn_connection_tunnel2_address" {
  description = "VPN connection tunnel 2 address"
  value       = aws_vpn_connection.this.tunnel2_address
}

output "vpn_connection_tunnel2_preshared_key" {
  description = "VPN connection tunnel 2 preshared key"
  value       = aws_vpn_connection.this.tunnel2_preshared_key
  sensitive   = true
}
