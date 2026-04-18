terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

locals {
  service_name    = "${var.project_name}-api"
  repository_name = "${var.project_name}-api"
  deployer_sa_id  = "${var.project_name}-deployer"
}

# -----------------------------------------------------------------------------
# Artifact Registry — stores the backend container image
# -----------------------------------------------------------------------------
resource "google_artifact_registry_repository" "api" {
  project       = var.gcp_project_id
  location      = var.gcp_region
  repository_id = local.repository_name
  format        = "DOCKER"
  description   = "Backend API container images (${var.project_name})"
}

# -----------------------------------------------------------------------------
# Cloud Run service — runs the backend
#
# The actual container image is pushed and the revision is updated by the
# GitHub Actions deploy workflow. Terraform manages the service shell only
# and ignores changes to the image tag to avoid fighting the CI pipeline.
# -----------------------------------------------------------------------------
resource "google_cloud_run_v2_service" "api" {
  project  = var.gcp_project_id
  location = var.gcp_region
  name     = local.service_name

  ingress             = "INGRESS_TRAFFIC_ALL"
  deletion_protection = false

  template {
    containers {
      image = var.initial_image

      ports {
        container_port = 8080
      }

      env {
        name  = "NODE_ENV"
        value = "production"
      }
    }

    scaling {
      min_instance_count = 0
      max_instance_count = var.max_instance_count
    }
  }

  lifecycle {
    ignore_changes = [
      template[0].containers[0].image,
      client,
      client_version,
    ]
  }

  depends_on = [google_artifact_registry_repository.api]
}

# Allow unauthenticated invocations (public API). Tighten if needed.
resource "google_cloud_run_v2_service_iam_member" "public" {
  count = var.allow_unauthenticated ? 1 : 0

  project  = google_cloud_run_v2_service.api.project
  location = google_cloud_run_v2_service.api.location
  name     = google_cloud_run_v2_service.api.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# -----------------------------------------------------------------------------
# Deployer service account — impersonated by GitHub Actions via WIF to push
# images and deploy new revisions.
# -----------------------------------------------------------------------------
resource "google_service_account" "deployer" {
  project      = var.gcp_project_id
  account_id   = local.deployer_sa_id
  display_name = "${var.project_name} deployer (GitHub Actions)"
}

resource "google_artifact_registry_repository_iam_member" "deployer_writer" {
  project    = google_artifact_registry_repository.api.project
  location   = google_artifact_registry_repository.api.location
  repository = google_artifact_registry_repository.api.name
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${google_service_account.deployer.email}"
}

resource "google_project_iam_member" "deployer_run_admin" {
  project = var.gcp_project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.deployer.email}"
}

resource "google_project_iam_member" "deployer_sa_user" {
  project = var.gcp_project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.deployer.email}"
}

# -----------------------------------------------------------------------------
# Workload Identity Federation — lets GitHub Actions impersonate the deployer
# service account without any long-lived key.
# -----------------------------------------------------------------------------
resource "google_iam_workload_identity_pool" "github" {
  project                   = var.gcp_project_id
  workload_identity_pool_id = "${var.project_name}-gh-pool"
  display_name              = "${var.project_name} GitHub Actions"
}

resource "google_iam_workload_identity_pool_provider" "github" {
  project                            = var.gcp_project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.github.workload_identity_pool_id
  workload_identity_pool_provider_id = "github"
  display_name                       = "GitHub Actions OIDC"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.repository" = "assertion.repository"
    "attribute.ref"        = "assertion.ref"
  }

  attribute_condition = "assertion.repository == \"${var.github_repository}\""

  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account_iam_member" "github_wif" {
  service_account_id = google_service_account.deployer.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github.name}/attribute.repository/${var.github_repository}"
}
