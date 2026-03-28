resource "cloudflare_workers_script" "api" {
  account_id  = var.account_id
  script_name = "${var.project_name}-api"
  main_module = "index.js"

  content = file("${path.module}/../../../backend/dist/index.js")
}

# -----------------------------------------------------------------------------
# Workers Route (uncomment when zone is configured)
# -----------------------------------------------------------------------------
# resource "cloudflare_workers_route" "api" {
#   zone_id = var.zone_id
#   pattern = "api.example.com/*"
#   script  = cloudflare_workers_script.api.script_name
# }

# -----------------------------------------------------------------------------
# Workers Custom Domain (uncomment when needed)
# -----------------------------------------------------------------------------
# resource "cloudflare_workers_custom_domain" "api" {
#   account_id = var.account_id
#   service    = cloudflare_workers_script.api.script_name
#   hostname   = "api.example.com"
# }
