output "id" {
  description = "The OCID of the instance"
  value       = oci_core_instance.instance.id
}

output "private_ip" {
  description = "The private IP address of the instance"
  value       = oci_core_instance.instance.private_ip
}
