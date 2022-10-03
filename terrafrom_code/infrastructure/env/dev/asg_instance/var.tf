variable "region" {
  type        = string
  description = "Region"
}

variable "env_name" {
  type        = string
  description = "name of the frontend application"
}

variable "application_name" {
  type        = string
  description = "name of the frontend application"
}

variable "ami_frontend" {
  type        = string
  description = "AMI for frontend"
}

variable "instance_type_frontend" {
  type        = string
  description = "Instance type for frontend"
}

variable "public_key" {
  type        = string
  description = "pem key for app instances"
}

variable "listener_rule_condition" {
  type    = string
  default = "host-header"
}
variable "listener_rule_condition_values" {
  type = list(string)
}

variable "asg_min_size" {
  type = number
}
variable "asg_max_size" {
  type = number
}
variable "asg_desired_size" {
  type = number
}