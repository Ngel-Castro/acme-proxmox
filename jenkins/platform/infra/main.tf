module "vms_qemu" {
  source = "github.com/Ngel-Castro/vm_qemu_multiple?ref=stable"

  # Pass in required variables
    proxmox_host            = var.proxmox_host
    proxmox_token_id        = var.proxmox_token_id
    proxmox_token_secret    = var.proxmox_token_secret
    vms                     = var.vms
    environment             = var.environment
}


# data "template_file" "inventory" {
#   template = file("${path.module}/inventory.tpl")

#   vars = {
#     vm_ip = module.vms_qemu.vm_ip
#     host_name = var.name
#   }
# }

# resource "local_file" "ansible_inventory" {
#   filename = "${path.module}/inventory_${var.environment}.yaml"
#   content  = data.template_file.inventory.rendered
# }

