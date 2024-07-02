module "lxc_containers" {
  source = "github.com/Ngel-Castro/lxc_module?ref=stable"

  # Pass in required variables
    proxmox_host            = var.proxmox_host
    proxmox_token_id        = var.proxmox_token_id
    proxmox_token_secret    = var.proxmox_token_secret
    containers              = var.containers
    environment             = var.environment
    default_password        = var.default_password
    public_key_encryption   = var.public_key_encryption
    public_key              = var.public_key
}

data "template_file" "inventory" {
  template = file("${path.module}/inventory.tpl")

  vars = {
    vms_inventory = local.lxc_inventory_json
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory_${var.environment}.yaml"
  content  = data.template_file.inventory.rendered
}

