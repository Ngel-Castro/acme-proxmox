# Platform example for jenkins

In this accelerator we use opentofu and jenkins to start the bootstrapping process of a platform using proxmox. ultimately, we could use the same playbook to 
host the infra in any cloud provider

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | 2.5.1 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vms_qemu"></a> [vms\_qemu](#module\_vms\_qemu) | github.com/Ngel-Castro/vm_qemu_multiple | stable |

## Resources

| Name | Type |
|------|------|
| [local_file.ansible_inventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [template_file.inventory](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_password"></a> [default\_password](#input\_default\_password) | Default LXC vm password | `string` | `"changeme"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | on which enviroment the project will be running | `string` | `"dev"` | no |
| <a name="input_proxmox_host"></a> [proxmox\_host](#input\_proxmox\_host) | Value for proxmox cluster/server | `string` | `"https://192.168.0.131:8006/api2/json"` | no |
| <a name="input_proxmox_token_id"></a> [proxmox\_token\_id](#input\_proxmox\_token\_id) | Proxmox Token user@pam!token\_id | `string` | `"terraform-prov@pve!terraform"` | no |
| <a name="input_proxmox_token_secret"></a> [proxmox\_token\_secret](#input\_proxmox\_token\_secret) | Proxmox token secret | `string` | n/a | yes |
| <a name="input_vms"></a> [vms](#input\_vms) | n/a | <pre>list(object({<br>        name            = string<br>        target_node     = string<br>        storage         = string<br>        storage_size    = number<br>        full_clone      = bool<br>        template_name   = string<br>        network_bridge  = string<br>        memory          = number<br>        cores           = number<br>        tags            = string<br>        ip              = optional(string, "dhcp")<br>        vmid            = optional(number, null)<br>        gw              = optional(string, null)<br>    }))</pre> | <pre>[<br>  {<br>    "cores": 2,<br>    "full_clone": true,<br>    "memory": 2048,<br>    "name": "vm",<br>    "network_bridge": "vmbr0",<br>    "storage": "Kingstone-data",<br>    "storage_size": 32,<br>    "tags": "tofu",<br>    "target_node": "proxmox",<br>    "template_name": "ubuntu-server-beta"<br>  }<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm-inventory"></a> [vm-inventory](#output\_vm-inventory) | Virtual machine(s) inventory |
