variable "name" {
  type        = string
  description = "Security group name"
}

variable "description" {
  type        = string
  description = "Security group description"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "ingress_rules" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
    description     = optional(string)
  }))
  description = "Ingress rules"
  default     = []
}

variable "egress_rules" {
  type = list(object({
    from_port       = number
    to_port         = number
    protocol        = string
    cidr_blocks     = optional(list(string))
    security_groups = optional(list(string))
    description     = optional(string)
  }))
  description = "Egress rules"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}
