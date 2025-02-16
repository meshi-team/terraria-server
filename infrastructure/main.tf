module "network" {
  source = "./modules/network"

  compartment_id = var.oci_compartment_id
  name_suffix    = var.oci_resources_name_suffix
  server_port    = var.server_port
}

module "compute" {
  source = "./modules/compute"

  compartment_id = var.oci_compartment_id
  subnet_id      = module.network.subnet_id

  name_suffix    = var.oci_resources_name_suffix
  ocpus          = var.server_ocpus
  memory_in_gbs  = var.server_memory_in_gbs
  ssh_public_key = var.server_ssh_public_key
}

module "public_ip" {
  source = "./modules/public_ip"

  compartment_id = var.oci_compartment_id
  subnet_id      = module.network.subnet_id
  private_ip     = module.compute.private_ip
}

module "dns" {
  source = "./modules/dns"

  zone_id   = var.cloudflare_zone_id
  subdomain = var.server_subdomain
  target    = module.public_ip.public_ip
}
