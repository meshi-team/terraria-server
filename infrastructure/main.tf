module "github_env_read" {
  source = "./modules/github_env/read"

  github_repository = var.github_repository
}

module "compartment" {
  source = "./modules/compartment"

  parent_compartment_id = var.oci_compartment_id
  name                  = var.github_repository
}

module "network" {
  source = "./modules/network"

  compartment_id = module.compartment.id
  name_suffix    = var.github_repository

  server_port = module.github_env_read.variables["SERVER_PORT"]
}

module "compute" {
  source = "./modules/compute"

  compartment_id = module.compartment.id
  name_suffix    = var.github_repository

  subnet_id      = module.network.subnet_id
  ocpus          = module.github_env_read.variables["SERVER_OCPUS"]
  memory_in_gbs  = module.github_env_read.variables["SERVER_MEMORY_IN_GBS"]
  ssh_public_key = module.github_env_read.variables["SERVER_SSH_PUBLIC_KEY"]
}

module "public_ip" {
  source = "./modules/public_ip"

  compartment_id = module.compartment.id
  name_suffix    = var.github_repository

  subnet_id  = module.network.subnet_id
  private_ip = module.compute.private_ip
}

module "dns" {
  source = "./modules/dns"

  domain    = var.cloudflare_domain
  subdomain = module.github_env_read.variables["SERVER_SUBDOMAIN"]
  target    = module.public_ip.public_ip
}

module "github_env_write" {
  source = "./modules/github_env/write"

  github_repository = var.github_repository

  variables = {
    SERVER_DOMAIN    = module.dns.full_domain
    SERVER_PUBLIC_IP = module.public_ip.public_ip
  }
}
