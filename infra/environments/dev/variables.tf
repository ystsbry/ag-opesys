variable "project_name" {
  description = "Project name"
  type        = string
  default     = "ag-opesys"
}

# GCP
variable "gcp_project_id" {
  description = "GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP region (e.g. asia-northeast1)"
  type        = string
  default     = "asia-northeast1"
}

variable "github_repository" {
  description = "GitHub repository allowed to impersonate the deployer service account (format: owner/repo)"
  type        = string
}

# Auth0
variable "auth0_domain" {
  description = "Auth0 tenant domain"
  type        = string
}

variable "auth0_client_id" {
  description = "Auth0 management API client ID"
  type        = string
  sensitive   = true
}

variable "auth0_client_secret" {
  description = "Auth0 management API client secret"
  type        = string
  sensitive   = true
}

variable "auth0_api_identifier" {
  description = "Auth0 API identifier (audience)"
  type        = string
  default     = "https://api.ag-opesys.example.com"
}

# Neon
variable "neon_api_key" {
  description = "Neon API key"
  type        = string
  sensitive   = true
}
