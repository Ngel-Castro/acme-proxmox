output "vm-ip" {
    value = module.vms_qemu.vm_ips
    description = "The IP address(es) of the VM(s)"
}
output "vm-id" {
    value = module.vms_qemu.vm_vmids
    description = "Virtual Machine ID(s)"
}