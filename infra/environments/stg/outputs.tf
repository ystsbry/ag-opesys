output "cloudflare_worker_script_id" {
  description = "Cloudflare Worker script ID"
  value       = module.cloudflare.worker_script_id
}

output "auth0_spa_client_id" {
  description = "Auth0 SPA client ID"
  value       = module.auth0.spa_client_id
}

output "supabase_database_host" {
  description = "Supabase database host"
  value       = module.supabase.database_host
}
