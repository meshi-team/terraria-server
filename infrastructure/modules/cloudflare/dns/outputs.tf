output "full_domain" {
  description = "The full domain name"
  value       = "${var.subdomain}.${var.domain}"
}
