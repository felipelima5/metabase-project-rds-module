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