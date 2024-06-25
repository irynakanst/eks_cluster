### docdb cluster

# resource "aws_docdb_cluster" "docdb" {
#   cluster_identifier              = "my-docdb-cluster-test"
#   engine                          = "docdb"
#   master_username                 = "superuser"
#   master_password                 = "superpassword"
#   backup_retention_period         = 1
#   skip_final_snapshot             = true
#   apply_immediately               = true
#   availability_zones              = ["us-east-1a", "us-east-1b"]
#   db_subnet_group_name            = aws_docdb_subnet_group.docdb-subnet-gp.id
#   db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.docdb-param-gp.id
#   deletion_protection             = false
#   #   storage_encrypted = true
#   #   kms_key_id = 
#   port                   = 27017
#   vpc_security_group_ids = [aws_security_group.docdb-sg.id]
# }

### docdb cluster instances

# resource "aws_docdb_cluster_instance" "cluster_instances" {
#   count              = 1
#   identifier         = "my-docdb-cluster-test-${count.index}"
#   cluster_identifier = aws_docdb_cluster.docdb.id
#   instance_class     = "db.t3.medium"
#   apply_immediately  = true
# }

### docdb parameter group

resource "aws_docdb_cluster_parameter_group" "docdb-param-gp" {
  family      = "docdb5.0"
  name        = "no-tls-parameter-group"
  description = "docdb-test no tls cluster parameter group"

  parameter {
    name  = "tls"
    value = "disabled"
  }
}

### docdb subnet groups

resource "aws_docdb_subnet_group" "docdb-subnet-gp" {
  name       = "docdb-subnet-group"
  subnet_ids = ["subnet-0dbfb302199752bc2", "subnet-09e8de94c5c449353"]

  tags = {
    Name = "My docdb-test subnet group"
  }
}

### security group for docdb

resource "aws_security_group" "docdb-sg" {
  name        = "docdb-test sg"
  description = "Allow worker inbound traffic and all outbound traffic"
  vpc_id      = "vpc-0efe0b6e01d5c6b71"
}

### ingress rule for docdb

resource "aws_vpc_security_group_ingress_rule" "allow_eks_worker_ipv4" {
  source_security_group_id = "sg-08eb1ab570cf7fcab"
  security_group_id = "sg-08eb1ab570cf7fcab"
  from_port         = 27017
  ip_protocol       = "tcp"
  to_port           = 27017
#   cidr_ipv4         = "0.0.0.0/0"
}

### egress rule for docdb

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.docdb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
#   from_port         = 0
#   to_port           = 0
  ip_protocol       = "-1" # semantically equivalent to all ports
}
