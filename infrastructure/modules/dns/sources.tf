data "cloudflare_zones" "zone" {
  name = var.domain
}
