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
variable "target_node" {
  description = "Proxmox target node"
  type        = string
}

variable "proxmox_token_secret" {
  description = "Proxmox token secret"
  type        = string
}

variable "storage" {
  description = "Storage location in PROXMOX node"
  type        = string
  default     = "samsung_ssd"
}

variable "full_clone" {
  description = "If you required full clone or not"
  type        = bool
  default     = false
}

variable "template_name" {
  description = "If you required full clone or not"
  type        = string
  default     = "cluster-template"
}

variable "network_bridge" {
  description = "Network bridge for VM"
  type        = string
  default     = "vmbr0"
}
variable "memory" {
  description = "Memory for VM"
  type        = number
  default     = 2048
}

variable "name" {
  description = "Name of the VM"
  type        = string
}