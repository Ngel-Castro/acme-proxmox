module "jenkins_controller" {
  source = "github.com/Ngel-Castro/proxmox_single_vm_module?ref=stable"

  # Pass in required variables
    proxmox_host      = var.proxmox_host
    proxmox_token_id  = var.proxmox_token_id
    proxmox_token_secret = var.proxmox_token_secret
    target_node       = var.target_node
    storage           = var.storage
    full_clone        = var.full_clone
    template_name     = var.template_name
    network_bridge    = var.network_bridge
    memory            = var.memory
    name              = "${var.name}-${var.environment}"
}


data "template_file" "inventory" {
  template = file("${path.module}/inventory.tpl")

  vars = {
    vm_ip = module.jenkins_controller.vm_ip
    host_name = var.name
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory_${var.environment}.yaml"
  content  = data.template_file.inventory.rendered
}

