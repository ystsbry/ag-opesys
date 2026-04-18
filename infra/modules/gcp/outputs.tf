output "service_name" {
  description = "Cloud Run service name"
  value       = google_cloud_run_v2_service.api.name
}

output "service_url" {
  description = "Cloud Run service URL (auto-assigned *.run.app)"
  value       = google_cloud_run_v2_service.api.uri
}

output "artifact_registry_repository" {
  description = "Artifact Registry repository name"
  value       = google_artifact_registry_repository.api.name
}

output "artifact_registry_location" {
  description = "Artifact Registry location"
  value       = google_artifact_registry_repository.api.location
}

output "deployer_service_account_email" {
  description = "Email of the service account impersonated by GitHub Actions via WIF"
  value       = google_service_account.deployer.email
}

output "workload_identity_provider" {
  description = "Full resource name of the WIF provider (used by GitHub Actions as workload_identity_provider input)"
  value       = google_iam_workload_identity_pool_provider.github.name
}
