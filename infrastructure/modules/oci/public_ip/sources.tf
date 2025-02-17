data "oci_core_private_ips" "private_ip" {
  subnet_id  = var.subnet_id
  ip_address = var.private_ip
}
