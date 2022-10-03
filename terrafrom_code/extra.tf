module "public_web_security_group" {
  source  = "../security-groups/"
  version = "1.0.0"
  enable_whitelist_ip = true
  name_sg = "Public web Security Group"
  vpc_id   = aws_vpc.main.id
  ingress_rule = {
    rules = {
      rule_list = [
          {
              description = "Rule for port 80"
              from_port = 80
              to_port = 80
              protocol = "tcp"
              cidr = ["0.0.0.0/0"]
              source_SG_ID = []
          },
          { 
              description = "Rule for port 443"
              from_port = 443
              to_port = 443
              protocol = "tcp"
              cidr = ["0.0.0.0/0"]
              source_SG_ID = []
          }
      ]
   }
  }
} 

module "pub_alb" {
  source  = "../alb/"
  version = "0.0.3"
  alb_name = format("%s-pub-alb", var.name)
  internal = false
  logs_bucket = var.logs_bucket
  security_groups_id = [module.public_web_security_group.sg_id]
  subnets_id = module.PublicSubnets.ids
  tags =var.tags
  enable_logging = var.enable_alb_logging
  enable_deletion_protection = var.enable_deletion_protection
}

resource "aws_route53_zone" "private_hosted_zone" {
  name = var.pvt_zone_name
  vpc {
    vpc_id = aws_vpc.main.id
  }
}

