resource "supabase_project" "main" {
  organization_id   = var.organization_id
  name              = "${var.project_name}-${var.environment}"
  region            = var.region
  database_password = var.database_password
}
