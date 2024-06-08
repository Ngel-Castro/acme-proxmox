output "vm-ip" {
    value = module.vm_single_instance.vm_ip
    description = "The IP address of the Pi-hole VM"
}
output "vm-id" {
    value = module.vm_single_instance.vm_id
    description = "Virtual Machine ID"
}