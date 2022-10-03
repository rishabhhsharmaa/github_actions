module "database_security_group" {
  source                             = "../../../modules/security_group/"
  enable_whitelist_ip                = false
  enable_source_security_group_entry = true
  name_sg                            = "rds-sg"
  vpc_id                             = data.terraform_remote_state.network.outputs.vpc_id
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "Rule for port 1433"
          from_port    = 1433
          to_port      = 1433
          protocol     = "tcp"
          cidr         = []
          source_SG_ID = [data.terraform_remote_state.asg_instance.outputs.backend_sg_id]
        },
      ]
    }
  }
}

module "database_mssql" {
  source                   = "git::https://github.com/OT-CLOUD-KIT/terraform-aws-rds-mssql.git"
  database_security_groups = [module.database_security_group.sg_id]
  database_subnet_ids      = [data.terraform_remote_state.network.outputs.pvt_subnet_ids[0][0], data.terraform_remote_state.network.outputs.pvt_subnet_ids[0][1]]
  engine_name              = var.engine_name
  identifier               = var.identifier
  password                 = var.password
  subnet_group_name        = var.subnet_group_name
  license_model            = var.license_model
  instance_class           = var.instance_class
}
