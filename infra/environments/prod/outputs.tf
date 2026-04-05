output "cloudflare_worker_script_name" {
  description = "Cloudflare Worker script name"
  value       = module.cloudflare.worker_script_name
}

output "auth0_spa_client_id" {
  description = "Auth0 SPA client ID"
  value       = module.auth0.spa_client_id
}

output "neon_database_host" {
  description = "Neon database host"
  value       = module.neon.database_host
}
