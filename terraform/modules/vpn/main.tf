resource "aws_vpn_gateway" "this" {
  vpc_id          = var.vpc_id
  amazon_side_asn = var.vpn_gateway_asn

  tags = merge(var.tags, { Name = var.name })
}

resource "aws_customer_gateway" "this" {
  bgp_asn    = var.customer_gateway_bgp_asn
  ip_address = var.customer_gateway_ip
  type       = "ipsec.1"

  tags = merge(var.tags, { Name = "${var.name}-cgw" })
}

resource "aws_vpn_connection" "this" {
  vpn_gateway_id      = aws_vpn_gateway.this.id
  customer_gateway_id = aws_customer_gateway.this.id
  type                = "ipsec.1"
  static_routes_only  = var.static_routes_only

  tags = merge(var.tags, { Name = "${var.name}-connection" })
}

resource "aws_vpn_connection_route" "this" {
  for_each               = toset(var.vpn_connection_static_routes)
  destination_cidr_block = each.value
  vpn_connection_id      = aws_vpn_connection.this.id
}

resource "aws_vpn_gateway_attachment" "this" {
  vpc_id         = var.vpc_id
  vpn_gateway_id = aws_vpn_gateway.this.id
}

resource "aws_vpn_gateway_route_propagation" "this" {
  count          = length(var.route_table_ids)
  vpn_gateway_id = aws_vpn_gateway.this.id
  route_table_id = var.route_table_ids[count.index]
}
