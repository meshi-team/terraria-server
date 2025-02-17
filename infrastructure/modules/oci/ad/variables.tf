variable "compartment_id" {
  description = "OCID of the compartment in which to create the resources"
  type        = string
}

variable "number" {
  description = "Availability Domain number"
  type        = number
  default     = 1

  validation {
    condition     = var.number > 0 && var.number <= 3
    error_message = "Availability Domain number must be between 1 and 3"
  }
}
