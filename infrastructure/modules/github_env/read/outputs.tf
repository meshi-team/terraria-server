locals {
  github_env_vars = { for v in data.github_actions_variables.variables.variables : v.name => v.value }
}

output "server_memory_in_gbs" {
  description = "Amount of memory in GBs for the server instance"
  value       = try(local.github_env_vars["SERVER_MEMORY_IN_GBS"], null)
}

output "server_ocpus" {
  description = "Number of OCPUs for the server instance"
  value       = try(local.github_env_vars["SERVER_OCPUS"], null)
}

output "server_port" {
  description = "Port for the server"
  value       = try(local.github_env_vars["SERVER_PORT"], null)
}

output "server_ssh_public_key" {
  description = "SSH public key for the server instance"
  value       = try(local.github_env_vars["SERVER_SSH_PUBLIC_KEY"], null)
}

output "server_subdomain" {
  description = "Subdomain for the server"
  value       = try(local.github_env_vars["SERVER_SUBDOMAIN"], null)
}
