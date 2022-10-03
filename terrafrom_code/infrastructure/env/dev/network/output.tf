output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "pvt_subnet_ids" {
  value = module.vpc.pvt_subnet_ids
}

