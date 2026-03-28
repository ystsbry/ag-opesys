variable "project_name" {
  description = "Project name"
  type        = string
  default     = "ag-opesys"
}

# Cloudflare
variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "cloudflare_account_id" {
  description = "Cloudflare account ID"
  type        = string
}

variable "cloudflare_zone_id" {
  description = "Cloudflare zone ID"
  type        = string
  default     = ""
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

# Supabase
variable "supabase_access_token" {
  description = "Supabase management API access token"
  type        = string
  sensitive   = true
}

variable "supabase_organization_id" {
  description = "Supabase organization ID"
  type        = string
}

variable "supabase_database_password" {
  description = "Supabase database password"
  type        = string
  sensitive   = true
}
