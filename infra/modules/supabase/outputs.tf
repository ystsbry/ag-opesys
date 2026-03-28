output "project_id" {
  description = "Supabase project ID"
  value       = supabase_project.main.id
}

output "database_host" {
  description = "Supabase database host"
  value       = supabase_project.main.database_host
}
