resource "aws_db_instance" "rds" {
  identifier                            = var.instance_identifier #-----------------------Nome da Instancia RDS
  db_name                               = var.db_name             #-----------------------------------Nome do database inicial a ser criado
  allocated_storage                     = var.allocated_storage
  max_allocated_storage                 = var.max_allocated_storage
  publicly_accessible                   = var.publicly_accessible
  engine                                = var.engine
  engine_version                        = var.engine_version
  instance_class                        = var.instance_class
  multi_az                              = var.multi_az
  username                              = var.username
  password                              = random_password.rds_instance_password.result
  parameter_group_name                  = aws_db_parameter_group.this.name_prefix
  db_subnet_group_name                  = aws_db_subnet_group.this.name
  backup_retention_period               = var.backup_retention_period
  copy_tags_to_snapshot                 = var.copy_tags_to_snapshot
  deletion_protection                   = var.deletion_protection
  skip_final_snapshot                   = var.skip_final_snapshot
  storage_encrypted                     = var.storage_encrypted
  storage_type                          = var.storage_type
  iops                                  = var.iops
  monitoring_role_arn                   = aws_iam_role.rds_monitoring_role.arn
  monitoring_interval                   = var.monitoring_interval

  vpc_security_group_ids = [aws_security_group.this.id]

  tags = merge(var.tags, var.aditional_tags)
}


resource "aws_db_parameter_group" "this" {
  name        = var.instance_identifier
  description = var.instance_identifier
  family      = var.parameter_group_family

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(var.tags, var.aditional_tags)
}

resource "aws_db_subnet_group" "this" {
  name        = var.instance_identifier
  description = var.instance_identifier
  subnet_ids  = var.subnets_ids
  tags        = merge(var.tags, var.aditional_tags)
}