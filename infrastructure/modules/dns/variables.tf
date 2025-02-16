variable "zone_id" {
  description = "ID of the domain to create the record in"
  type        = string
}

variable "subdomain" {
  description = "Subdomain to create the record for"
  type        = string
}

variable "target" {
  description = "Public IP address to point the record to"
  type        = string
}

variable "ttl" {
  description = "TTL of the record"
  type        = number
  default     = 3600
}
