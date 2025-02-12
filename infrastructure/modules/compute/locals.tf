locals {
  instance_name = "instance-${var.name_suffix}"
}

locals {
  vnic_name = "vnic-${local.instance_name}"
}
