output "server_public_ip" {
  description = "The public IP address of the server"
  value       = module.public_ip.public_ip
}
