resource "aws_db_instance" "myRDS" {
  engine                   = var.engine_name
  db_name                  = var.db_name
  identifier               = var.identifier
  username                 = var.username
  password                 = var.password
  db_subnet_group_name     = aws_db_subnet_group.db_sub_group.id
  skip_final_snapshot      = var.skip_final_snapshot
  delete_automated_backups = var.delete_automated_backups
  multi_az                 = var.multi_az
  publicly_accessible      = var.public_access
  vpc_security_group_ids   = var.database_security_groups
  instance_class           = var.instance_class
  allocated_storage        = var.allocated_storage
  license_model            = var.license_model
  tags                     = var.tags
}
