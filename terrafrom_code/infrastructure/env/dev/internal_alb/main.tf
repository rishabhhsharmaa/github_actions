module "internal_alb_security_group" {
  source  = "../../../modules/security_group/"
  name_sg = "dev-internal-alb-sg"
  enable_whitelist_ip                = true
  enable_source_security_group_entry = false
  vpc_id  = data.terraform_remote_state.network.outputs.vpc_id
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "Rule for port 80"
          from_port    = 80
          to_port      = 80
          protocol     = "tcp"
          cidr         = var.whitelist_ips
          source_SG_ID = []
        },
        {
          description  = "Rule for port 443"
          from_port    = 443
          to_port      = 443
          protocol     = "tcp"
          cidr         = var.whitelist_ips
          source_SG_ID = []
        }
      ]
    }
  }
}

module "internal_alb" {
  source                     = "../../../modules/alb/"
  alb_name                   = var.alb_name
  internal                   = true
  security_groups_id         = [module.internal_alb_security_group.sg_id]
  subnets_id                 = [data.terraform_remote_state.network.outputs.pvt_subnet_ids[0][0], data.terraform_remote_state.network.outputs.pvt_subnet_ids[0][1]]
  logs_bucket                = var.logs_bucket
  enable_logging             = var.enable_logging
  enable_deletion_protection = var.enable_deletion_protection
  tags                       = var.tags
  alb_certificate_arn        = var.alb_certificate_arn
}