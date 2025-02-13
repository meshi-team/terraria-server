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
