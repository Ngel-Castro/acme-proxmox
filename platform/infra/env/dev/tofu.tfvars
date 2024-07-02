environment       = "dev"
containers = [
    { 
        name            = "container-1", 
        target_node     = "proxmox", 
        storage         = "Kingstone-data",
        storage_size    = "10G",
        full_clone      = true
        template_name   = "samsung-ssd:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
        network_bridge  = "vmbr0"
        memory          = 2048
        cores           = 2
        tags            = "tofu"
        unprivileged    = true
        ip              = "192.168.0.200/24"
        vmid            = 200
        gw              = "192.168.0.1"
    },
    { 
        name            = "container-2", 
        target_node     = "proxmox", 
        storage         = "Kingstone-data",
        storage_size    = "10G",
        full_clone      = true
        template_name   = "samsung-ssd:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
        network_bridge  = "vmbr0"
        memory          = 2048
        cores           = 2
        tags            = "tofu"
        unprivileged    = true
        ip              = "192.168.0.201/24"
        vmid            = 201
        gw              = "192.168.0.1"
    }
]
default_password  = "BasicLXCContainer"
public_key_encryption = "ssh-ed25519"
public_key = "AAAAC3NzaC1lZDI1NTE5AAAAIKOPgZn0hyLV+UGoAZkIUlUYeyIqbSOPYSU+wpqoIZ7h"