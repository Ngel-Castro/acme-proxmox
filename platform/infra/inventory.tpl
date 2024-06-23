all:
  children:
%{ for idx, vm in jsondecode(vms_inventory) ~}
  %{ if vm.name == "jenkins" ~}
    ${vm.name}:
        children:
          controller:
            hosts:
              controller1:
                ansible_host: "${vm.ip}"
                ansible_user: "administrator"
                ansible_ssh_private_key_file: '{{ cluster_ssh_key }}'
                platform_environment: '{{ platform_environment }}'
  %{ else ~}
  ${vm.name}:
        children:
          manager:
            hosts:
              ${vm.name}1:
                ansible_host: "${vm.ip}"
                ansible_user: "administrator"
                ansible_ssh_private_key_file: '{{ cluster_ssh_key }}'
                platform_environment: '{{ platform_environment }}'
  %{ endif ~}
%{ endfor ~}