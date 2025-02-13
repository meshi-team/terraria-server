output "public_ip" {
  description = "The public IP address of the instance"
  value       = oci_core_instance.instance.public_ip
  sensitive   = true
}
