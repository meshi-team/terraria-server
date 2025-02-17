output "name" {
  description = "The name of the availability domain"
  value       = data.oci_identity_availability_domain.ad.name
}
