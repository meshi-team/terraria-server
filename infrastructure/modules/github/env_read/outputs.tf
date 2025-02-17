locals {
  github_env_vars = { for v in data.github_actions_variables.variables.variables : v.name => v.value }
}

output "variables" {
  description = "Variables from the GitHub Actions environment"
  value = tomap({
    "SERVER_AD_NUMBER"                = local.github_env_vars["SERVER_AD_NUMBER"],
    "SERVER_BOOT_VOLUME_SIZE_IN_GBS"  = local.github_env_vars["SERVER_BOOT_VOLUME_SIZE_IN_GBS"],
    "SERVER_BLOCK_VOLUME_SIZE_IN_GBS" = local.github_env_vars["SERVER_BLOCK_VOLUME_SIZE_IN_GBS"],
    "SERVER_BLOCK_VOLUME_BACKUP_ID"   = try(local.github_env_vars["SERVER_BLOCK_VOLUME_BACKUP_ID"], ""),
    "SERVER_MEMORY_IN_GBS"            = local.github_env_vars["SERVER_MEMORY_IN_GBS"],
    "SERVER_OCPUS"                    = local.github_env_vars["SERVER_OCPUS"],
    "SERVER_PORT"                     = local.github_env_vars["SERVER_PORT"],
    "SERVER_SOURCE_IMAGE_ID"          = local.github_env_vars["SERVER_SOURCE_IMAGE_ID"],
    "SERVER_SSH_PUBLIC_KEY"           = local.github_env_vars["SERVER_SSH_PUBLIC_KEY"],
    "SERVER_SUBDOMAIN"                = local.github_env_vars["SERVER_SUBDOMAIN"],
  })
}
