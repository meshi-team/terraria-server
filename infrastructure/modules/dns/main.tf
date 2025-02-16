resource "cloudflare_dns_record" "dns_record" {
  zone_id = data.cloudflare_zones.zone.result.0.id

  type    = "A"
  name    = var.subdomain
  content = var.target
  proxied = false
  ttl     = var.ttl
}
