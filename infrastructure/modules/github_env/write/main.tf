resource "github_actions_variable" "variables" {
  for_each = var.variables

  repository = var.github_repository

  variable_name = each.key
  value         = each.value
}
