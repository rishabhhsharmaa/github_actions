variable "region" {
  type        = string
  description = "Region"
  default     = "ap-south-1"
}

variable "engine_name" {
  description = "name of db engine"
  type        = string
  default     = "sqlserver-se"
}

variable "identifier" {
  description = "name of db identifier"
  type        = string
  default     = "prod-rds-mssql"
}

variable "license_model" {
  type = string
  description = "(optional) describe your variable"
  default = "license-included"
}


variable "db_name" {
  description = "Enter the name of the database to be created inside DB Instance"
  type        = string
  default     = null
}

variable "username" {
  description = "username"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "Enter the password"
  type        = string
  default     = "S8qgbdevsg"
}

variable "delete_automated_backups" {
  description = "delete automated backup (yes or no)"
  type        = bool
  default     = true
}

variable "skip_final_snapshot" {
  description = "skip backup"
  type        = bool
  default     = true
}

variable "multi_az" {
  description = "if multi az"
  type        = bool
  default     = false
}

variable "public_access" {
  description = "Publically accessible"
  type        = bool
  default     = false
}

variable "instance_class" {
  description = "type of instance"
  type        = string
  default     = "db.m5.large"
}

variable "allocated_storage" {
  description = "storage size"
  type        = number
  default     = 50
}

variable "subnet_group_name" {
  description = "primary subnet name"
  type        = string
  default     = "prod-db-subnet"
}

variable "tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default = {
    "owner" = "devops"
    "env"   = "prod"
    "type"  = "database"
  }
}