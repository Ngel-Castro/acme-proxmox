locals {
  module_outputs  = {
    for k, v in module.lxc_containers.container_vmids : k => {
      "id"   = v
      "ip"   = module.lxc_containers.container_ips[k]
    }
  }

  containers_inventory = [
    for i, vm in var.vms : {
      name = vm.name
      id   = local.module_outputs[tostring(i)]["id"]
      ip   = local.module_outputs[tostring(i)]["ip"]
    }
  ]
  lxc_inventory_json = jsonencode(local.containers_inventory)
}
