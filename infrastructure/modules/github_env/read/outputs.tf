locals {
  github_env_vars = { for v in data.github_actions_variables.variables.variables : v.name => v.value }
}

output "variables" {
  description = "Variables from the GitHub Actions environment"
  value = tomap({
    "SERVER_MEMORY_IN_GBS"  = local.github_env_vars["SERVER_MEMORY_IN_GBS"],
    "SERVER_OCPUS"          = local.github_env_vars["SERVER_OCPUS"],
    "SERVER_PORT"           = local.github_env_vars["SERVER_PORT"],
    "SERVER_SSH_PUBLIC_KEY" = local.github_env_vars["SERVER_SSH_PUBLIC_KEY"],
    "SERVER_SUBDOMAIN"      = local.github_env_vars["SERVER_SUBDOMAIN"],
  })
}
