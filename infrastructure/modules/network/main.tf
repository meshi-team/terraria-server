resource "oci_core_vcn" "test_vcn" {
  compartment_id = var.compartment_id

  cidr_block                       = var.vcn_cidr_block
  cidr_blocks                      = var.vcn_cidr_blocks
  defined_tags                     = { "Operations.CostCenter" = "42" }
  display_name                     = var.vcn_display_name
  dns_label                        = var.vcn_dns_label
  freeform_tags                    = { "Department" = "Finance" }
  ipv6private_cidr_blocks          = var.vcn_ipv6private_cidr_blocks
  is_ipv6enabled                   = var.vcn_is_ipv6enabled
  is_oracle_gua_allocation_enabled = var.vcn_is_oracle_gua_allocation_enabled
  security_attributes              = var.vcn_security_attributes
}
