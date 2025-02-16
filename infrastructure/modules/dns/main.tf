resource "cloudflare_dns_record" "dns_record" {
  zone_id = data.cloudflare_zone.zone.id

  type    = "A"
  name    = var.subdomain
  content = var.target
  proxied = false
  ttl     = var.ttl
}
