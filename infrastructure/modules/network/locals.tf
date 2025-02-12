locals {
  vcn_name    = "vcn-${var.name_suffix}"
  subnet_name = "subnet-${var.name_suffix}"
}

locals {
  ig_name            = "ig-${local.vcn_name}"
  security_list_name = "security_list-${local.vcn_name}"
  route_table_name   = "route_table-${local.vcn_name}"
}
