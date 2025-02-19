variable "github_repository" {
  description = "Name of the GitHub repository"
  type        = string
}

variable "variables" {
  description = "Map of variables to set in the GitHub repository"
  type        = map(string)
  default     = {}
}

variable "secrets" {
  description = "Map of secrets to set in the GitHub repository"
  type        = map(string)
  default     = {}
}
