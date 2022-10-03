locals {
  subnet_az = [
    for i in var.availability_zones :
    "${var.region}${i}"
  ]
}