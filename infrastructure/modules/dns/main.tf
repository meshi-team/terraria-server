resource "cloudflare_dns_record" "dns_record" {
  zone_id = var.zone_id

  type    = "A"
  name    = var.subdomain
  content = var.target
  proxied = var.is_proxied
  ttl     = local.ttl
}
