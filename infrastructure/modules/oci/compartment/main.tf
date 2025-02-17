resource "oci_identity_compartment" "compartment" {
  compartment_id = var.parent_compartment_id

  name          = var.name
  description   = local.description
  enable_delete = false
}
