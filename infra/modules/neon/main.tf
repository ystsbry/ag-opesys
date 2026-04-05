terraform {
  required_providers {
    neon = {
      source  = "kislerdm/neon"
      version = "~> 0.6"
    }
  }
}

resource "neon_project" "main" {
  name                      = "${var.project_name}-${var.environment}"
  region_id                 = var.region_id
  history_retention_seconds = var.history_retention_seconds
}

resource "neon_branch" "main" {
  project_id = neon_project.main.id
  name       = "main"
}

resource "neon_endpoint" "main" {
  project_id = neon_project.main.id
  branch_id  = neon_branch.main.id
  type       = "read_write"
}

resource "neon_database" "main" {
  project_id = neon_project.main.id
  branch_id  = neon_branch.main.id
  name       = var.database_name
  owner_name = neon_role.app.name
}

resource "neon_role" "app" {
  project_id = neon_project.main.id
  branch_id  = neon_branch.main.id
  name       = var.database_role
}
