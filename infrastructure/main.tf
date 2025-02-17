module "github_env_read" {
  source = "./modules/github/env_read"

  github_repository = var.github_repository
}

module "compartment" {
  source = "./modules/oci/compartment"

  parent_compartment_id = var.oci_compartment_id
  name                  = var.github_repository
}

module "network" {
  source = "./modules/oci/network"

  compartment_id = module.compartment.id
  name_suffix    = var.github_repository

  server_port = module.github_env_read.variables["SERVER_PORT"]
}

module "ad" {
  source = "./modules/oci/ad"

  compartment_id = module.compartment.id
  number         = module.github_env_read.variables["SERVER_AD_NUMBER"]
}

module "instance" {
  source = "./modules/oci/instance"

  compartment_id = module.compartment.id
  name_suffix    = var.github_repository

  ad_name                 = module.ad.name
  subnet_id               = module.network.subnet_id
  ocpus                   = module.github_env_read.variables["SERVER_OCPUS"]
  memory_in_gbs           = module.github_env_read.variables["SERVER_MEMORY_IN_GBS"]
  boot_volume_size_in_gbs = module.github_env_read.variables["SERVER_BOOT_VOLUME_SIZE_IN_GBS"]
  source_image_id         = module.github_env_read.variables["SERVER_SOURCE_IMAGE_ID"]
  ssh_public_key          = module.github_env_read.variables["SERVER_SSH_PUBLIC_KEY"]
}

module "volume" {
  source = "./modules/oci/volume"

  compartment_id = module.compartment.id
  name_suffix    = var.github_repository

  ad_name     = module.ad.name
  instance_id = module.instance.id
  size_in_gbs = module.github_env_read.variables["SERVER_BLOCK_VOLUME_SIZE_IN_GBS"]
}

module "public_ip" {
  source = "./modules/oci/public_ip"

  compartment_id = module.compartment.id
  name_suffix    = var.github_repository

  subnet_id  = module.network.subnet_id
  private_ip = module.instance.private_ip
}

module "dns" {
  source = "./modules/cloudflare/dns"

  domain    = var.cloudflare_domain
  subdomain = module.github_env_read.variables["SERVER_SUBDOMAIN"]
  target    = module.public_ip.public_ip
}

module "github_env_write" {
  source = "./modules/github/env_write"

  github_repository = var.github_repository

  variables = {
    SERVER_DOMAIN    = module.dns.full_domain
    SERVER_PUBLIC_IP = module.public_ip.public_ip
  }
}
