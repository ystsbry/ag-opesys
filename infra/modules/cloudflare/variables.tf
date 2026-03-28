variable "account_id" {
  description = "Cloudflare account ID"
  type        = string
}

variable "zone_id" {
  description = "Cloudflare zone ID"
  type        = string
  default     = ""
}

variable "project_name" {
  description = "Project name used as a prefix for resources"
  type        = string
}
