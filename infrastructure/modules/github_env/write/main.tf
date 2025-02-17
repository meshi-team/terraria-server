resource "github_actions_variable" "server_domain" {
  for_each = var.variables

  repository = var.github_repository

  variable_name = each.key
  value         = each.value
}
