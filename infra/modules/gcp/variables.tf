variable "gcp_project_id" {
  description = "GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP region (e.g. asia-northeast1)"
  type        = string
}

variable "project_name" {
  description = "Project name used as a prefix for GCP resources"
  type        = string
}

variable "github_repository" {
  description = "GitHub repository allowed to impersonate the deployer service account (format: owner/repo)"
  type        = string
}

variable "initial_image" {
  description = "Initial container image for Cloud Run (e.g. gcr.io/cloudrun/hello). The real image is deployed via GitHub Actions."
  type        = string
  default     = "gcr.io/cloudrun/hello"
}

variable "max_instance_count" {
  description = "Maximum Cloud Run instance count"
  type        = number
  default     = 5
}

variable "allow_unauthenticated" {
  description = "Whether to allow unauthenticated invocations (public API)"
  type        = bool
  default     = true
}
