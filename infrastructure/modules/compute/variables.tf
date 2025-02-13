variable "compartment_id" {
  description = "OCID of the compartment in which to create the resources"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "OCID of the subnet in which to create the instance"
  type        = string
  sensitive   = true
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

variable "ad_number" {
  description = "Availability Domain number"
  type        = number
  default     = 1

  validation {
    condition     = var.ad_number > 0 && var.ad_number <= 3
    error_message = "Availability Domain number must be between 1 and 3"
  }
}

variable "source_image_id" {
  description = "OCID of the source OS image for the instance"
  type        = string
  default     = "ocid1.image.oc1.iad.aaaaaaaarv24gpcgg66ccfdh6posr5rrfhm2is26sr7523omdi6ebjenzo2a"
}

variable "ocpus" {
  description = "Number of OCPUs for the instance"
  type        = number

  validation {
    condition     = var.ocpus > 0 && var.ocpus <= 4
    error_message = "Number of OCPUs must be between 1 and 4"
  }
}

variable "memory_in_gbs" {
  description = "Amount of memory in GBs for the instance"
  type        = number

  validation {
    condition     = var.memory_in_gbs > 0 && var.memory_in_gbs <= 24
    error_message = "Amount of memory must be between 1 and 24 GBs"
  }
}

variable "boot_volume_size_in_gbs" {
  description = "Size of the boot volume in GBs"
  type        = number
  default     = 50
}

variable "ssh_public_key" {
  description = "SSH public key allowed to connect to the instance"
  type        = string
  sensitive   = true
}
