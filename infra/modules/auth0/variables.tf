variable "project_name" {
  description = "Project name used as a prefix for resources"
  type        = string
}

variable "api_identifier" {
  description = "Auth0 API identifier (audience)"
  type        = string
}

variable "callback_urls" {
  description = "Allowed callback URLs for the SPA"
  type        = list(string)
}

variable "logout_urls" {
  description = "Allowed logout URLs for the SPA"
  type        = list(string)
}

variable "web_origins" {
  description = "Allowed web origins for the SPA"
  type        = list(string)
}
