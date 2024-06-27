### security group for docdb

resource "aws_security_group" "docdb-sg" {
  name        = "docdb-test sg"
  description = "Allow worker inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0efe0b6e01d5c6b71"
}

### ingress rule for docdb

resource "aws_vpc_security_group_ingress_rule" "allow_eks_worker_ipv4" {
  referenced_security_group_id = "sg-08eb1ab570cf7fcab"
  security_group_id            = aws_security_group.docdb-sg.id
  from_port                    = 27017
  ip_protocol                  = "tcp"
  to_port                      = 27017
  #   cidr_ipv4         = "0.0.0.0/0"
}

### egress rule for docdb

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.docdb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  #   from_port         = 0
  #   to_port           = 0
  ip_protocol = "-1" # semantically equivalent to all ports
}
