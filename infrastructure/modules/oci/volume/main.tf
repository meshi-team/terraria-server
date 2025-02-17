resource "oci_core_volume" "volume" {
  compartment_id = var.compartment_id

  display_name        = local.volume_name
  availability_domain = var.ad_name

  size_in_gbs = var.size_in_gbs
  vpus_per_gb = 10

  dynamic "source_details" {
    for_each = var.backup_id != "" ? [1] : []
    content {
      type = "volumeBackup"
      id   = var.backup_id
    }
  }
}
