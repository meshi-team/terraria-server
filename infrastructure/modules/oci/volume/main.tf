resource "oci_core_volume" "volume" {
  compartment_id = var.compartment_id

  display_name        = local.volume_name
  availability_domain = var.ad_name

  size_in_gbs = var.size_in_gbs
  vpus_per_gb = 10

  dynamic "source_details" {
    for_each = var.backup_id != null ? [1] : []
    content {
      type = "volumeBackup"
      id   = var.backup_id
    }
  }
}

resource "oci_core_volume_attachment" "volume_attachment" {
  attachment_type = "paravirtualized"
  instance_id     = var.instance_id
  volume_id       = oci_core_volume.volume.id

  display_name                        = local.volume_attachment_name
  is_pv_encryption_in_transit_enabled = true
  is_read_only                        = false
  is_shareable                        = false
}
