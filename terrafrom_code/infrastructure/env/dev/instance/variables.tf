variable "region" {
  type        = string
  description = "Region"
}
variable "ec2_name" {
  description = "Name of bastion"
  type        = string
}
variable "tags" {
  description = "Additional tags"
  type        = map(string)
}
variable "volume_size" {
  description = "volume size"
  type        = number
}
variable "instance_type" {
  description = "Name of Launch configuration"
  type        = string
}
variable "ami_id" {
  description = "Name of Launch configuration"
  type        = string
}
variable "public_key" {
  type        = string
  description = "pem key for Jenkins instance"
}
variable "env" {
  type        = string
  description = "Environment name"
}
variable "volume_type" {
  description = "volume type"
  type        = string
}
