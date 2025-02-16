output "public_ip" {
  value       = oci_core_public_ip.public_ip.ip_address
  description = "The public IP address"
}
