locals {
  module_outputs  = {
    for k, v in module.vms_qemu.vm_vmids : k => {
      "id"   = v
      "ip"   = module.vms_qemu.vm_ips[k]
    }
  }

  vms_inventory = [
    for i, vm in var.vms : {
      name = vm.name
      id   = local.module_outputs[tostring(i)]["id"]
      ip   = local.module_outputs[tostring(i)]["ip"]
    }
  ]
  vms_inventory_json = jsonencode(local.vms_inventory)
}
