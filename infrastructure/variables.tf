variable "oci_region" {
  description = "OCI region"
  type        = string
  default     = "us-ashburn-1"
}

variable "oci_tenancy_id" {
  description = "OCI tenancy OCID"
  type        = string
}

variable "oci_user_id" {
  description = "OCI user OCID"
  type        = string
}

variable "oci_api_fingerprint" {
  description = "OCI API fingerprint"
  type        = string
}

variable "oci_api_private_key" {
  description = "OCI API private key"
  type        = string
  sensitive   = true
}

variable "oci_compartment_id" {
  description = "OCI compartment OCID"
  type        = string
}

variable "cloudflare_api_token" {
  description = "Cloudflare API token"
  type        = string
  sensitive   = true
}

variable "cloudflare_domain" {
  description = "Name of the domain in Cloudflare"
  type        = string
}

variable "github_organization" {
  description = "GitHub organization name"
  type        = string
}

variable "github_app_id" {
  description = "GitHub App ID"
  type        = number
}

variable "github_app_installation_id" {
  description = "GitHub App installation ID"
  type        = number
}

variable "github_app_private_key" {
  description = "GitHub App private key"
  type        = string
  sensitive   = true
}

variable "github_repository" {
  description = "GitHub repository name"
  type        = string
}
