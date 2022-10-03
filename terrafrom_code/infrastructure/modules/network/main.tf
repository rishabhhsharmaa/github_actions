resource "aws_vpc" "main" {
  cidr_block                       = var.cidr_block
  instance_tenancy                 = var.instance_tenancy
  enable_dns_support               = var.enable_dns_support
  enable_dns_hostnames             = var.enable_dns_hostnames

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
  )
}

resource "aws_flow_log" "vpc_flow_logs" {
  count = var.enable_vpc_logs == true ? 1 : 0
  log_destination      = var.logs_bucket_arn
  log_destination_type = var.log_destination_type
  traffic_type         = var.traffic_type
  vpc_id               = aws_vpc.main.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    {
      "Name" = format("%s-igw", var.name)
    },
    var.tags,
  )
}

module "publicRouteTable" {
  source  = "../route_table/"
  version = "0.0.1"
  cidr = "0.0.0.0/0"
  gateway_id  = aws_internet_gateway.igw.id
  name        = format("%s-pub-rtb", var.name)
  vpc_id      = aws_vpc.main.id
  tags = var.tags
}

module "PublicSubnets" {
  source  = "../subnets/"
  version = "0.0.1"
  availability_zones = var.avaialability_zones
  name = format("%s-pub-sn", var.name)
  route_table_id = module.publicRouteTable.id
  subnets_cidr = var.public_subnets_cidr
  vpc_id      = aws_vpc.main.id
  tags = var.tags
}

module "nat-gateway" {
  source  = "../nat_gateway/"
  version = "0.0.1"
  subnets_for_nat_gw = module.PublicSubnets.ids
  vpc_name = var.name
  tags = var.tags
}

module "privateRouteTable" {
  source  = "../route_table/"
  version = "0.0.1"
  cidr = "0.0.0.0/0"
  gateway_id  = module.nat-gateway.ngw_id
  name        = format("%s-pvt-rtb", var.name)
  vpc_id      = aws_vpc.main.id
  tags = var.tags
}

module "PrivateSubnets" {
  source  = "../subnets/"
  version = "0.0.1"
  availability_zones = var.avaialability_zones
  name = format("%s-pvt-sn", var.name)
  route_table_id = module.privateRouteTable.id
  subnets_cidr = var.private_subnets_cidr
  vpc_id      = aws_vpc.main.id
  tags = var.tags
}
