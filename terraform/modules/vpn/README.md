# VPN Module

Creates AWS Site-to-Site VPN with VPN Gateway, Customer Gateway, and VPN Connection.

## Features

- VPN Gateway with configurable ASN
- Customer Gateway configuration
- VPN Connection with IPsec tunnels
- Static route support
- Route propagation to route tables
- BGP support

## Usage

```hcl
module "vpn" {
  source                      = "../../modules/vpn"
  name                        = "site-to-site-vpn"
  vpc_id                      = module.vpc.vpc_id
  customer_gateway_ip         = "203.0.113.5"
  customer_gateway_bgp_asn    = 65000
  vpn_gateway_asn             = 64512
  static_routes_only          = true
  vpn_connection_static_routes = ["192.168.1.0/24", "192.168.2.0/24"]
  route_table_ids             = [module.vpc.private_route_table_id]

  tags = {
    Environment = "production"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| name | VPN name prefix | string | - | yes |
| vpc_id | VPC ID | string | - | yes |
| customer_gateway_ip | Customer gateway public IP | string | - | yes |
| vpn_gateway_asn | AWS VPN gateway ASN | number | 64512 | no |
| customer_gateway_bgp_asn | Customer gateway BGP ASN | number | 65000 | no |
| static_routes_only | Use static routes only | bool | true | no |
| vpn_connection_static_routes | Static route CIDRs | list(string) | [] | no |
| route_table_ids | Route tables for propagation | list(string) | [] | no |
| tags | Resource tags | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| vpn_gateway_id | VPN Gateway ID |
| customer_gateway_id | Customer Gateway ID |
| vpn_connection_id | VPN Connection ID |
| vpn_connection_tunnel1_address | Tunnel 1 public IP |
| vpn_connection_tunnel1_preshared_key | Tunnel 1 pre-shared key (sensitive) |
| vpn_connection_tunnel2_address | Tunnel 2 public IP |
| vpn_connection_tunnel2_preshared_key | Tunnel 2 pre-shared key (sensitive) |

## VPN Configuration

After deployment:
1. Download VPN configuration from AWS Console
2. Configure customer gateway device with tunnel details
3. Verify BGP sessions or static routes
4. Test connectivity

## Notes

- VPN Connection provides two redundant tunnels
- Pre-shared keys are marked as sensitive
- Route propagation automatically updates route tables
- Customer gateway IP must be publicly routable
- BGP ASN must be unique per gateway
