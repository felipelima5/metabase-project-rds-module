resource "random_password" "rds_role_name_sufixo" {
  length      = 10
  special     = false
  upper       = false
  lower       = false
  number      = true
  numeric     = true
  min_numeric = 10
}