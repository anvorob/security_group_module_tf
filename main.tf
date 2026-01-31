resource "aws_security_group" "main" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  tags = {
    Name = var.name
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rule" {
  for_each = var.ingress_rules
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = each.value.cidr_ipv4
  referenced_security_group_id = each.value.source_security_group_id
  from_port         = each.value.from_port
  ip_protocol       = each.value.ip_protocol
  to_port           = each.value.to_port
}

resource "aws_vpc_security_group_egress_rule" "egress_rule" {
  for_each = var.egress_rules
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = each.value.cidr_ipv4
  referenced_security_group_id = each.value.source_security_group_id
  from_port         = each.value.from_port
  ip_protocol       = each.value.ip_protocol
  to_port           = each.value.to_port
}
