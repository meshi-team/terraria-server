provider "oci" {
  region = var.oci_region

  tenancy_ocid = var.oci_tenancy_id
  user_ocid    = var.oci_user_id
  fingerprint  = var.oci_api_fingerprint
  private_key  = var.oci_api_private_key
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "github" {
  owner = var.github_organization
  app_auth {
    id              = var.github_app_id
    installation_id = var.github_app_installation_id
    pem_file        = var.github_app_private_key
  }
}
