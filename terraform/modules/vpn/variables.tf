variable "name" {
  type        = string
  description = "VPN name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "vpn_gateway_asn" {
  type        = number
  description = "VPN gateway ASN"
  default     = 64512
}

variable "customer_gateway_ip" {
  type        = string
  description = "Customer gateway public IP"
}

variable "customer_gateway_bgp_asn" {
  type        = number
  description = "Customer gateway BGP ASN"
  default     = 65000
}

variable "static_routes_only" {
  type        = bool
  description = "Use static routes only"
  default     = true
}

variable "vpn_connection_static_routes" {
  type        = list(string)
  description = "VPN connection static routes"
  default     = []
}

variable "route_table_ids" {
  type        = list(string)
  description = "Route table IDs for route propagation"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}
