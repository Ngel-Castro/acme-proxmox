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
| <a name="module_jenkins_controller"></a> [jenkins\_controller](#module\_jenkins\_controller) | github.com/Ngel-Castro/proxmox_single_vm_module | stable |

## Resources

| Name | Type |
|------|------|
| [local_file.ansible_inventory](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [template_file.inventory](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_full_clone"></a> [full\_clone](#input\_full\_clone) | If you required full clone or not | `bool` | `false` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory for VM | `number` | `2048` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the VM | `string` | n/a | yes |
| <a name="input_network_bridge"></a> [network\_bridge](#input\_network\_bridge) | Network bridge for VM | `string` | `"vmbr0"` | no |
| <a name="input_proxmox_host"></a> [proxmox\_host](#input\_proxmox\_host) | Value for proxmox cluster/server | `string` | `"https://192.168.0.131:8006/api2/json"` | no |
| <a name="input_proxmox_token_id"></a> [proxmox\_token\_id](#input\_proxmox\_token\_id) | Proxmox Token user@pam!token\_id | `string` | `"terraform-prov@pve!terraform"` | no |
| <a name="input_proxmox_token_secret"></a> [proxmox\_token\_secret](#input\_proxmox\_token\_secret) | Proxmox token secret | `string` | n/a | yes |
| <a name="input_storage"></a> [storage](#input\_storage) | Storage location in PROXMOX node | `string` | `"samsung_ssd"` | no |
| <a name="input_target_node"></a> [target\_node](#input\_target\_node) | Proxmox target node | `string` | n/a | yes |
| <a name="input_template_name"></a> [template\_name](#input\_template\_name) | If you required full clone or not | `string` | `"cluster-template"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm-id"></a> [vm-id](#output\_vm-id) | Virtual Machine ID |
| <a name="output_vm-ip"></a> [vm-ip](#output\_vm-ip) | The IP address of the Pi-hole VM |
