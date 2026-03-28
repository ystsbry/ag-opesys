output "spa_client_id" {
  description = "Auth0 SPA application client ID"
  value       = auth0_client.spa.client_id
}

output "api_identifier" {
  description = "Auth0 API identifier"
  value       = auth0_resource_server.api.identifier
}
