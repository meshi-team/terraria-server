resource "oci_core_instance" "instance" {
  compartment_id = var.compartment_id

  display_name        = local.instance_name
  availability_domain = var.ad_name

  shape = "VM.Standard.A1.Flex"
  shape_config {
    ocpus         = var.ocpus
    memory_in_gbs = var.memory_in_gbs
  }

  preserve_boot_volume                = false
  is_pv_encryption_in_transit_enabled = true
  source_details {
    source_type = "image"
    source_id   = var.source_image_id

    boot_volume_size_in_gbs         = var.boot_volume_size_in_gbs
    boot_volume_vpus_per_gb         = 10
    is_preserve_boot_volume_enabled = false
  }

  create_vnic_details {
    subnet_id = var.subnet_id

    assign_public_ip          = false
    assign_ipv6ip             = false
    assign_private_dns_record = false
    skip_source_dest_check    = true
  }

  launch_volume_attachments {
    type      = "paravirtualized"
    volume_id = var.attached_volume_id

    display_name                        = local.volume_attachment_name
    is_pv_encryption_in_transit_enabled = true
    is_read_only                        = false
    is_shareable                        = true
  }

  availability_config {
    is_live_migration_preferred = true
    recovery_action             = "RESTORE_INSTANCE"
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data           = base64encode(file("${path.module}/cloud-init.yml"))
  }
}
