region = "ap-south-1"

alb_name = "dev-internal-alb"

enable_deletion_protection = false

logs_bucket = "internal-alb-logs"

enable_logging = false

alb_certificate_arn = ""

whitelist_ips = ""

tags = {
  env   = "dev"
  owner = "devops"
  type  = "internal-alb"
}