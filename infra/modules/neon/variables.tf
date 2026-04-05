variable "project_name" {
  description = "Project name used as a prefix for resources"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, stg, prod)"
  type        = string
}

variable "region_id" {
  description = "Neon region ID"
  type        = string
  default     = "aws-ap-southeast-1"
}

variable "history_retention_seconds" {
  description = "History retention period in seconds (Free tier max: 21600)"
  type        = number
  default     = 21600
}

variable "database_name" {
  description = "Database name"
  type        = string
  default     = "ag_opesys"
}

variable "database_role" {
  description = "Database role name"
  type        = string
  default     = "app"
}
