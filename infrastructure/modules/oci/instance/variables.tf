variable "compartment_id" {
  description = "OCID of the compartment in which to create the instance"
  type        = string
}

variable "ad_name" {
  description = "Availability Domain name in which to create the instance"
  type        = string
}

variable "subnet_id" {
  description = "OCID of the subnet in which to create the instance"
  type        = string
}

variable "name_suffix" {
  description = "Suffix to append to the resources names"
  type        = string
}

variable "source_image_id" {
  description = "OCID of the source OS image for the instance"
  type        = string
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

  validation {
    condition     = var.boot_volume_size_in_gbs > 50 && var.boot_volume_size_in_gbs <= 200
    error_message = "Size of the boot volume must be between 50 and 200 GBs"
  }
}

variable "ssh_public_key" {
  description = "SSH public key allowed to connect to the instance"
  type        = string
}
