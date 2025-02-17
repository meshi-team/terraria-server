variable "compartment_id" {
  description = "OCID of the compartment in which to create the volume"
  type        = string
}

variable "name_suffix" {
  description = "Suffix to append to the resources names"
  type        = string
}

variable "ad_name" {
  description = "Availability Domain name in which to create the volume"
  type        = string
}

variable "size_in_gbs" {
  description = "Size of the volume in GBs"
  type        = number
  default     = 50

  validation {
    condition     = var.size_in_gbs >= 50 && var.size_in_gbs <= 200
    error_message = "Size of the volume must be between 50 and 200 GBs"
  }
}

variable "instance_id" {
  description = "OCID of the instance to attach the volume to"
  type        = string
}

variable "backup_id" {
  description = "OCID of the volume backup to restore the volume from"
  type        = string
  default     = ""
}
