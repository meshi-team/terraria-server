provider "oci" {
  region = var.oci_region

  tenancy_ocid = var.oci_tenancy_id
  user_ocid    = var.oci_user_id
  private_key  = var.oci_private_key
  fingerprint  = var.oci_key_fingerprint
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
