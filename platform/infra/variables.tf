variable "containers" {
    type = list(object({
        name = string
        target_node     = string
        storage         = string
        storage_size    = string
        full_clone      = bool
        template_name   = string
        network_bridge  = string
        memory          = number
        cores           = number
        unprivileged    = bool
        tags            = string
        ip              = optional(string, "dhcp")
        vmid            = optional(number, null)
        gw              = optional(string, null)
    }))
    default = [
        {
            name            = "container", 
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
  description = "Default LXC container password"
  type        = string
  default     = "changeme"
}

variable "public_key_encryption" {
  description = "public key encryption"
  type        = string
  default     = "ssh-ed25519"
}
 
variable "public_key" {
  description = "Public Key string"
  type        = string
  default     = "AAAAC3NzaC1lZDI1NTE5AAAAIKOPgZn0hyLV+UGoAZkIUlUYeyIqbSOPYSU+wpqoIZ7h"
}
variable "dns" {
  description = "DNS server"
  type        = string
  default     = "8.8.8.8"
}