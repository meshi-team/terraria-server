variable "compartment_id" {
  description = "OCID of the compartment in which to create the resources"
  type        = string
}

variable "name_suffix" {
  description = "Suffix to append to the resources names"
  type        = string

  validation {
    condition = can(regex("^[a-zA-Z0-9]+(-[a-zA-Z0-9]+)*$", var.name_suffix))
    error_message = join(" ", [
      "Name suffix must only contain alphanumeric characters,",
      "optionally separated by hyphens"
    ])
  }
}

variable "vcn_cidr_block" {
  description = "CIDR block for the VCN"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "server_port" {
  description = "Server port to allow TCP/UDP traffic to"
  type        = number

  validation {
    condition     = var.server_port > 0 && var.server_port < 65536
    error_message = "Server port must be between 1 and 65535"
  }
}
