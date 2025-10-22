output "alb_id" {
  description = "ALB ID"
  value       = aws_lb.this.id
}

output "alb_arn" {
  description = "ALB ARN"
  value       = aws_lb.this.arn
}

output "alb_dns_name" {
  description = "ALB DNS name"
  value       = aws_lb.this.dns_name
}

output "alb_zone_id" {
  description = "ALB zone ID"
  value       = aws_lb.this.zone_id
}

output "target_group_arn" {
  description = "Target group ARN"
  value       = aws_lb_target_group.this.arn
}

output "target_group_id" {
  description = "Target group ID"
  value       = aws_lb_target_group.this.id
}

output "listener_arn" {
  description = "Listener ARN"
  value       = aws_lb_listener.http.arn
}

output "listener_id" {
  description = "Listener ID"
  value       = aws_lb_listener.http.id
}
