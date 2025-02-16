resource "oci_core_public_ip" "public_ip" {
  compartment_id = var.compartment_id

  lifetime      = "RESERVED"
  private_ip_id = data.oci_core_private_ips.private_ip.private_ips.0.id
}
