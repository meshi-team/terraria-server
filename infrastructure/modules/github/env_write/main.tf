resource "github_actions_variable" "variables" {
  for_each = var.variables

  repository = var.github_repository

  variable_name = each.key
  value         = each.value
}

resource "github_actions_secret" "secrets" {
  for_each = var.secrets

  repository = var.github_repository

  secret_name     = each.key
  plaintext_value = each.value
}
