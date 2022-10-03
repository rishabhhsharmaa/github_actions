variable "engine_name" {
  description = "name of db engine"
  type        = string
  default     = "sqlserver-ex"
}

variable "identifier" {
  description = "name of db identifier"
  type        = string
  default     = "mssql-server"
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
  default     = "#12345"
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
  default     = "db.t3.small"
}

variable "license_model" {
  type = string
  description = "(optional) describe your variable"
}

variable "allocated_storage" {
  description = "storage size"
  type        = number
  default     = 20
}

variable "subnet_group_name" {
  description = "subnet group name"
  type        = string
}

variable "database_subnet_ids" {
  description = "ids of database subnets"
  type        = list(string)
  default     = null
}

variable "database_security_groups" {
  description = "security group of database"
  type        = list(any)
  default     = []
}

variable "tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}
