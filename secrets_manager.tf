resource "aws_secretsmanager_secret" "this" {
  name = "rds-db-${terraform.workspace}-${random_password.rds_instance_name_sufixo.result}"
}

resource "aws_secretsmanager_secret_version" "version" {
  secret_id = aws_secretsmanager_secret.this.id
 
  secret_string = jsonencode({
    "rds_username_${terraform.workspace}" = "admin"
    "rds_password_${terraform.workspace}" = "${random_password.rds_instance_password.result}"
  })
}

resource "random_password" "rds_instance_password" {
  length           = 20
  special          = true
  override_special = "!$%&*()[]{}<>"
}

resource "random_password" "rds_instance_name_sufixo" {
  length      = 10
  special     = false
  upper       = false
  lower       = false
  number      = true
  numeric     = true
  min_numeric = 10
}