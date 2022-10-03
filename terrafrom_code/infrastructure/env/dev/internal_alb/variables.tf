variable "region" {
  type        = string
  description = "Region"
}

variable "alb_name" {
  description = "Name of internal ALB"
  type        = string
}

variable "enable_deletion_protection" {
  type = bool
}

variable "logs_bucket" {
  description = "Name of bucket where we would be storing our logs"
}

variable "enable_logging" {
  type = bool
}

variable "tags" {
  description = "A map of tags to add to Internal alb"
  type        = map(string)
}

variable "alb_certificate_arn" {
  type        = string
  description = "Certificate arn"
}
variable "whitelist_ips" {
  type = string
  description = "required ip"
}