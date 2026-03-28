output "project_id" {
  description = "Neon project ID"
  value       = neon_project.main.id
}

output "connection_uri" {
  description = "Neon database connection URI"
  value       = neon_endpoint.main.host
  sensitive   = true
}

output "database_host" {
  description = "Neon database host"
  value       = neon_endpoint.main.host
}
