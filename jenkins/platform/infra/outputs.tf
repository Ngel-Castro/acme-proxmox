output "vm-ip" {
    value = module.jenkins_controller.vm_ip
    description = "The IP address of the VM"
}
output "vm-id" {
    value = module.jenkins_controller.vm_id
    description = "Virtual Machine ID"
}