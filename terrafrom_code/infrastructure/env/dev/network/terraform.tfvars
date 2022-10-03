vpc_name             = "management-vpc"
igw_name             = "management-igw"
pub_rt_name          = "management-pub"
pub_subnet_name      = "management-pub-subnet"
nat_name             = "management-nat"
pvt_rt_ame           = "management-pvt"
pvt_subnet_name      = "management-pvt-subnet"
cidr_block           = "10.10.0.0/16"
availability_zones   = ["a", "b"]
public_subnets_cidr  = ["10.10.0.0/24", "10.10.2.0/24"]
private_subnets_cidr = ["10.10.4.0/24", "10.10.6.0/24"]
logs_bucket_arn      = "arn:aws:s3:::vpc-logs"
region               = "ap-south-1"
tags = {
  "owner" = "devops"
  "env"   = "management"
}
