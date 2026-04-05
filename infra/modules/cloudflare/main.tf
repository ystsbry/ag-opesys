terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
  }
}

# Worker script is deployed via Wrangler (see deploy.yml).
# This module manages surrounding infrastructure (Route, Custom Domain, etc.).

locals {
  worker_script_name = "${var.project_name}-api"
}

# -----------------------------------------------------------------------------
# Workers Route (uncomment when zone is configured)
# -----------------------------------------------------------------------------
# resource "cloudflare_workers_route" "api" {
#   zone_id = var.zone_id
#   pattern = "api.example.com/*"
#   script  = local.worker_script_name
# }

# -----------------------------------------------------------------------------
# Workers Custom Domain (uncomment when needed)
# -----------------------------------------------------------------------------
# resource "cloudflare_workers_custom_domain" "api" {
#   account_id = var.account_id
#   service    = local.worker_script_name
#   hostname   = "api.example.com"
# }
