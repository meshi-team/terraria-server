output "server_public_ip" {
  description = "The public IP address of the server"
  value       = module.public_ip.public_ip
}

output "server_domain" {
  description = "The domain name of the server"
  value       = module.dns.full_domain
}
