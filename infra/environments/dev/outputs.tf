output "cloud_run_service_name" {
  description = "Cloud Run service name"
  value       = module.gcp.service_name
}

output "cloud_run_service_url" {
  description = "Cloud Run service URL (auto-assigned *.run.app)"
  value       = module.gcp.service_url
}

output "artifact_registry_repository" {
  description = "Artifact Registry repository name"
  value       = module.gcp.artifact_registry_repository
}

output "artifact_registry_location" {
  description = "Artifact Registry location"
  value       = module.gcp.artifact_registry_location
}

output "deployer_service_account_email" {
  description = "Service account email impersonated by GitHub Actions via WIF"
  value       = module.gcp.deployer_service_account_email
}

output "workload_identity_provider" {
  description = "Full resource name of the WIF provider (used by GitHub Actions)"
  value       = module.gcp.workload_identity_provider
}

output "auth0_spa_client_id" {
  description = "Auth0 SPA client ID"
  value       = module.auth0.spa_client_id
}

output "neon_database_host" {
  description = "Neon database host"
  value       = module.neon.database_host
}
