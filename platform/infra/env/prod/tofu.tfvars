environment       = "prod"
vms = [
    { 
        name            = "jenkins"
        target_node     = "proxmox"
        storage         = "Kingstone-data"
        storage_size    = 32
        full_clone      = true
        template_name   = "ubuntu-server-base"
        network_bridge  = "vmbr0"
        memory          = 3072
        cores           = 2
        tags            = "tofu"
    },
    { 
        name            = "artifacts"
        target_node     = "proxmox"
        storage         = "Kingstone-data"
        storage_size    = 32
        full_clone      = true
        template_name   = "ubuntu-server-base"
        network_bridge  = "vmbr0"
        memory          = 4096
        cores           = 2
        tags            = "tofu"
    }
]