output "server_domain" {
  description = "The server domain"
  value       = cloudflare_dns_record.dns_record.name
  sensitive   = true
}
