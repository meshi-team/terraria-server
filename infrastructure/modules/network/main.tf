resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_id

  display_name   = local.vcn_name
  dns_label      = local.vcn_name
  cidr_blocks    = [var.vcn_cidr_block]
  is_ipv6enabled = false
}

resource "oci_core_subnet" "subnet" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id

  display_name               = local.subnet_name
  dns_label                  = local.subnet_name
  cidr_block                 = var.subnet_cidr_block
  prohibit_public_ip_on_vnic = false # Public subnet

  route_table_id    = oci_core_default_route_table.route_table.id
  security_list_ids = [oci_core_default_security_list.security_list.id]
}

resource "oci_core_internet_gateway" "ig" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id

  display_name = local.ig_name
}

resource "oci_core_default_route_table" "route_table" {
  compartment_id             = var.compartment_id
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id

  display_name = local.route_table_name

  route_rules {
    description = "Allow internet access"

    network_entity_id = oci_core_internet_gateway.ig.id
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
  }
}

resource "oci_core_default_security_list" "security_list" {
  compartment_id             = var.compartment_id
  manage_default_resource_id = oci_core_vcn.vcn.default_security_list_id

  display_name = local.security_list_name

  egress_security_rules {
    description = "Allow all traffic to the internet"

    protocol         = "all"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    stateless        = false
  }

  ingress_security_rules {
    description = "Allow SSH traffic from the internet"

    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = false

    tcp_options {
      min = 22
      max = 22
    }
  }
  ingress_security_rules {
    description = "Allow TCP traffic from the internet to the server port"

    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = false

    tcp_options {
      min = var.server_port
      max = var.server_port
    }
  }
  ingress_security_rules {
    description = "Allow UDP traffic from the internet to the server port"

    protocol    = "17" # UDP
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = false

    udp_options {
      min = var.server_port
      max = var.server_port
    }
  }
}
