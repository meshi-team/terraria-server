locals {
  ttl = var.is_proxied ? 1 : var.ttl
}
