# Récupérer l'image Ubuntu
data "openstack_images_image_v2" "ubuntu" {
  name        = "Ubuntu 22.04"
  most_recent = true
}

# Pour la région Paris (EU-WEST-PAR), essayez ces flavors
data "openstack_compute_flavor_v2" "flavor" {
  name = "win-b2-7-flex"  # ou essayez "b2-7-flex"
}

# Créer ou récupérer une clé SSH
resource "openstack_compute_keypair_v2" "lab_keypair" {
  name       = var.ssh_key_name
  public_key = file("~/.ssh/id_ed25519.pub")
}

# Utiliser le réseau public Ext-Net directement
data "openstack_networking_network_v2" "ext_net" {
  name = "Ext-Net"
}

# Utiliser le module instance
module "nginx_instance" {
  source = "../../modules/instance"

  instance_name = var.instance_name
  flavor_id     = data.openstack_compute_flavor_v2.flavor.id
  image_id      = data.openstack_images_image_v2.ubuntu.id
  key_pair      = openstack_compute_keypair_v2.lab_keypair.name
  network_id    = data.openstack_networking_network_v2.ext_net.id
  region        = var.region

  providers = {
    openstack = openstack
  }
}
