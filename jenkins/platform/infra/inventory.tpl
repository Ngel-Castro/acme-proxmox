all:
  children:
    ${host_name}:
      children:
        controller:
          hosts:
            controller1:
              ansible_host: "${vm_ip}"
              ansible_user: "administrator"
              ansible_ssh_private_key_file: '{{ cluster_ssh_key }}'