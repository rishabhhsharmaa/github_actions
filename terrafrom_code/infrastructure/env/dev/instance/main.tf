resource "aws_key_pair" "project-pem" {
  key_name   = format("%s-instance-key", "${var.env}")
  public_key = var.public_key
}

module "project_instance" {
  source          = "../../../modules/ec2_instance/"
  ec2_name        = var.ec2_name
  tags            = var.tags
  instance_type   = var.instance_type
  key_name        = aws_key_pair.project-pem.key_name
  volume_size     = var.volume_size
  subnet          = data.terraform_remote_state.network.outputs.public_subnet_ids[0][0]
  security_groups = [module.project_security_group.sg_id]
  ami_id          = var.ami_id
  volume_type     = var.volume_type
  public_ip       = false
}

module "project_security_group" {
  source              = "../../../modules/security_group/"
  enable_whitelist_ip = true
  name_sg             = format("%s-project-sg", "${var.env}")
  vpc_id              = data.terraform_remote_state.network.outputs.vpc_id
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "Rule for port 1194"
          from_port    = 1194
          to_port      = 1194
          protocol     = "udp"
          cidr         = ["0.0.0.0/0"]
          source_SG_ID = []
        },
        {
          description  = "Rule for port 22 allow from Rishabhs IP"
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
