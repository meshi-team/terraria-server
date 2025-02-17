variable "compartment_id" {
  description = "OCID of the compartment in which to create the resources"
  type        = string
}

variable "ad_number" {
  description = "Availability Domain number"
  type        = number
  default     = 1

  validation {
    condition     = var.ad_number > 0 && var.ad_number <= 3
    error_message = "Availability Domain number must be between 1 and 3"
  }
}
