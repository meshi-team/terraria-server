data "cloudflare_zone" "zone" {
  filter = {
    name = var.domain_name
  }
}
