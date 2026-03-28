variable "project_name" {
  description = "Project name used as a prefix for resources"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, stg, prod)"
  type        = string
}

variable "organization_id" {
  description = "Supabase organization ID"
  type        = string
}

variable "region" {
  description = "Supabase project region"
  type        = string
  default     = "ap-northeast-1"
}

variable "database_password" {
  description = "Password for the Supabase PostgreSQL database"
  type        = string
  sensitive   = true
}
