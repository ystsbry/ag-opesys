output "worker_script_id" {
  description = "Deployed Cloudflare Worker script ID"
  value       = cloudflare_workers_script.api.id
}

output "worker_script_name" {
  description = "Deployed Cloudflare Worker script name"
  value       = cloudflare_workers_script.api.script_name
}
