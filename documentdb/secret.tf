resource "random_password" "docdb_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "docdb_secret" {
  name = "docdb-secret"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "docdb_values" {
  secret_id     = aws_secretsmanager_secret.docdb_secret.id
  secret_string = jsonencode({
    master_username = "superuser"
    master_password = random_password.docdb_password.result
  })
}

data "aws_secretsmanager_secret" "docdb_secret" {
  name = aws_secretsmanager_secret.docdb_secret.name
}

data "aws_secretsmanager_secret_version" "docdb_values" {
  secret_id = data.aws_secretsmanager_secret.docdb_secret.id
}


locals {
  secret = jsondecode(data.aws_secretsmanager_secret_version.docdb_values.secret_string)
}
