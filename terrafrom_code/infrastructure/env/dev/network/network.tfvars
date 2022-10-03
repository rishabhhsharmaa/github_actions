vpc_name             = "{vpc_name}"
igw_name             = "{igw_name}"
pub_rt_name          = "{pub_rt_name}"
pub_subnet_name      = "{pub_subnet_name}"
nat_name             = "{nat_name}"
pvt_rt_ame          = "{pvt_rt_name}"
pvt_subnet_name      = "{pvt_subnet_name}"
alb_name              = "{alb_name}"
cidr_block           = "{cidr_block}"
pvt_zone_name        = "{pvt_zone_name}"
availability_zones   = ["a", "b"]
public_subnets_cidr  = ["10.10.0.0/23", "10.10.2.0/23"]
private_subnets_cidr = ["10.10.4.0/23", "10.10.6.0/23", "10.10.16.0/21", "10.10.24.0/21"]
logs_bucket          = "{logs_bucket}"
logs_bucket_arn      = "{logs_bucket_arn}"
public_web_sg_name   = "{public_web_sg_name}"
region               = "{region}"
tags = {
  "owner" = "devops"
  "env"   = "management"
}

alb_certificate_arn = "{alb_certificate_arn}"