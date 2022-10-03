resource "aws_key_pair" "asg_instance" {
  key_name   = "asg-instance-key"
  public_key = var.public_key
}

resource "aws_autoscaling_policy" "frontend-policy" {
  name                      = "prod-asg-policy"
  autoscaling_group_name    = module.asg_instance_one.asg_name
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 200
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = "60"
  }
}

module "asg_instance_security_group" {
  source                             = "../../../modules/security_group/"
  enable_whitelist_ip                = true
  enable_source_security_group_entry = false
  name_sg = "asg-instance-sg"
  vpc_id  = data.terraform_remote_state.network.outputs.vpc_id
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "Rule for port 80"
          from_port    = 80
          to_port      = 80
          protocol     = "tcp"
          cidr         = ["0.0.0.0/0"]
          source_SG_ID = []
        },
        {
          description  = "Rule for port 22"
          from_port    = 22
          to_port      = 22
          protocol     = "tcp"
          cidr         = ["0.0.0.0/0"]
          source_SG_ID = []
        }
      ]
    }
  }
}

module "asg_instance_one" {
  source                         = "../../../modules/asg_instance/"
  applicaton_name                = var.application_name
  env_name                       = var.env_name
  applicaton_port                = 80
  applicaton_health_check_target = "/"

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id

  route53_zone_id = data.terraform_remote_state.network.outputs.route53_zone_id
  route53_name    = "frontend.${data.terraform_remote_state.network.outputs.route53_name}"
  alb_dns_cname   = [data.terraform_remote_state.internal_alb.outputs.alb_dns_name]
  ttl             = "60"

  listener_arn                   = data.terraform_remote_state.network.outputs.public_alb_https_listener_arn
  priority                       = "98"
  listener_rule_condition        = "host-header"
  listener_rule_condition_values = var.listener_rule_condition_values

  ami_id                  = var.ami_frontend
  instance_type           = var.instance_type_frontend
  instance_key_name       = aws_key_pair.asg_instance.key_name
  security_groups         = [module.asg_instance_security_group.sg_id, data.terraform_remote_state.network.outputs.vpc_web_sg_id]
  volume_size             = "8"
  instance_subnets        = [data.terraform_remote_state.network.outputs.pvt_subnet_ids[2], data.terraform_remote_state.network.outputs.pvt_subnet_ids[3]]
  launch_template_version = "$Latest"

  asg_health_check_type     = "EC2"
  asg_wait_for_elb_capacity = 0

  asg_min_size     = var.asg_min_size
  asg_max_size     = var.asg_max_size
  asg_desired_size = var.asg_desired_size
}
