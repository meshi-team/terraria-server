output "public_ip" {
  description = "The public IP address"
  value       = oci_core_public_ip.public_ip.ip_address
}
