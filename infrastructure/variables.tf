variable "oci_region" {
  description = "OCI region"
  type        = string
  default     = "us-ashburn-1"
}

variable "oci_tenancy_id" {
  description = "OCI tenancy OCID"
  type        = string
  sensitive   = true
}

variable "oci_user_id" {
  description = "OCI user OCID"
  type        = string
  sensitive   = true
}

variable "oci_private_key" {
  description = "OCI private key"
  type        = string
  sensitive   = true
}

variable "oci_key_fingerprint" {
  description = "OCI fingerprint"
  type        = string
  sensitive   = true
}

variable "oci_compartment_id" {
  description = "OCI compartment OCID"
  type        = string
  sensitive   = true
}

variable "oci_resources_name_suffix" {
  description = "Name suffix for the created OCI resources"
  type        = string
  default     = "terraria-server"
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "cloudfare_domain" {
  description = "Domain name hosted in Cloudflare"
  type        = string
  sensitive   = true
}

variable "server_subdomain" {
  description = "Subdomain for the server"
  type        = string
  sensitive   = true
}

variable "server_port" {
  description = "Port for the server"
  type        = number
  sensitive   = true
}

variable "server_instance_ocpus" {
  description = "Number of OCPUs for the server instance"
  type        = number
}

variable "server_instance_memory_in_gbs" {
  description = "Memory in GBs for the server instance"
  type        = number
}
