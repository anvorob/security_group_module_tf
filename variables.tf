variable "security_groups"
{
  type = map(object({
    name = string
    description = string
    vpc_id = string
    ingress_rules = map(object({
      cidr_ipv4         = string
      source_security_group_id = string
      from_port         = number
      ip_protocol       = string
      to_port           = number
    }))
    egress_rules = map(object({
      cidr_ipv4         = string
      source_security_group_id = string
      from_port         = number
      ip_protocol       = string
      to_port           = number
    }))
  }))
}

#variable "name" {
#  type = string
#  description = "Security group name"
#}

#variable "description"
#{
#  type = string
#  description = "Security group description"
#}
#variable "vpc_id"
#{
#  type = string
#  description = "VPC ID where SG will be added to"
#}

#variable "ingress_rules"
#{
#  type = map(object({
#    cidr_ipv4         = string
#    from_port         = number
#    ip_protocol       = string
#    to_port           = number
#  }))  
#}

#variable "egress_rules"
#{
#  type = map(object({
#    cidr_ipv4         = string
#    from_port         = number
#    ip_protocol       = string
#    to_port           = number
#  }))
#}
