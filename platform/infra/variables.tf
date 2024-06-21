variable "vms" {
    type = list(object({
        name            = string
        target_node     = string
        storage         = string
        storage_size    = number
        full_clone      = bool
        template_name   = string
        network_bridge  = string
        memory          = number
        cores           = number
        tags            = string
        ip              = optional(string, "dhcp")
        vmid            = optional(number, null)
        gw              = optional(string, null)
    }))
    default = [
        {
            name            = "vm"
            target_node     = "proxmox"
            storage         = "Kingstone-data"
            storage_size    = 32
            full_clone      = true
            template_name   = "ubuntu-server-beta"
            network_bridge  = "vmbr0"
            memory          = 2048
            cores           = 2
            tags            = "tofu"
        }
    ]
}
variable "proxmox_host" {
  description = "Value for proxmox cluster/server"
  type        = string
  default     = "https://192.168.0.131:8006/api2/json"
}

variable "proxmox_token_id" {
  description = "Proxmox Token user@pam!token_id"
  type        = string
  default     = "terraform-prov@pve!terraform"
}

variable "proxmox_token_secret" {
  description = "Proxmox token secret"
  type        = string
}

variable "environment" {
  description = "on which enviroment the project will be running"
  type        = string
  default     = "dev"
}

variable "default_password" {
  description = "Default LXC vm password"
  type        = string
  default     = "changeme"
}
