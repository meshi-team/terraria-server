variable "zone_id" {
  description = "ID of the domain to create the record in"
  type        = string
  sensitive   = true
}

variable "subdomain" {
  description = "Subdomain to create the record for"
  type        = string
  sensitive   = true
}

variable "target" {
  description = "Public IP address to point the record to"
  type        = string
  sensitive   = true
}

variable "is_proxied" {
  description = "Whether the record is proxied by Cloudflare"
  type        = bool
  default     = true
}

variable "ttl" {
  description = "TTL of the record (if not proxied)"
  type        = number
  default     = 3600
}
