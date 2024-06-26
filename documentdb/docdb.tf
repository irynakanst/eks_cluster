### docdb cluster

resource "aws_docdb_cluster" "docdb" {
  cluster_identifier              = "my-docdb-cluster-test"
  engine                          = "docdb"
  master_username                 = local.secret.master_username #"superuser"
  master_password                 = local.secret.master_password #random_password.docdb_password.result
  backup_retention_period         = 1
  skip_final_snapshot             = true
  apply_immediately               = true
  availability_zones              = ["us-east-1a", "us-east-1b"]
  db_subnet_group_name            = aws_docdb_subnet_group.docdb-subnet-gp.id
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.docdb-param-gp.id
  deletion_protection             = false
  storage_encrypted               = true
  kms_key_id                      = "arn:aws:kms:us-east-1:861952334844:key/fddb7fc7-5b4d-45b9-a49c-e74df3dc2efb"
  port                            = 27017
  vpc_security_group_ids          = [aws_security_group.docdb-sg.id]
}

## docdb cluster instances

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "my-docdb-cluster-test-${count.index}"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = "db.t3.medium"
  apply_immediately  = true
}

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
