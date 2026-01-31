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
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.from_port
  ip_protocol       = var.ip_protocol
  to_port           = var.to_port
}

resource "aws_vpc_security_group_egress_rule" "egress_rule" {
  for_each = var.egress_rules
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.from_port
  ip_protocol       = var.ip_protocol
  to_port           = var.to_port
}
