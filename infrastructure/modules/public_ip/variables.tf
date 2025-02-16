variable "compartment_id" {
  description = "OCID of the compartment in which to create the resources"
  type        = string
}

variable "name_suffix" {
  description = "Suffix to append to the resources names"
  type        = string
}

variable "subnet_id" {
  description = "The OCID of the subnet where the private IP is located"
  type        = string
}

variable "private_ip" {
  description = "The private IP address to associate the public IP address with"
  type        = string
}
