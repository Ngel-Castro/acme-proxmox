#! /bin/bash/env bash
export ENV=$1

export SECRETS_FILE=~/.personal_vault/todopoderoso
export JENKINS_PLATFORM_INFRA=jenkins/platform/infra/
export JENKINS_PLATFORM_ANSIBLE=jenkins/platform/ansible/
## TODO change path to be more absolute. right now the assumption is that the .tfvars are inside `jenkins/platform` folder.
export JENKINS_VARS=env/${ENV}/tofu.tfvars
export SERVER_SSH_KEY=~/.ssh/cluster_alma

echo "Bootstrapping Jenkins"


echo "sourcing secrets..."
source $SECRETS_FILE


echo "Initializing opentofu"
initialLocation=$(pwd)
cd $JENKINS_PLATFORM_INFRA
tofu init

echo "Deploying infrastructure"
tofu plan -var-file=${JENKINS_VARS} -var="proxmox_token_id=${PROXMOX_TOKEN_ID}" -var="proxmox_token_secret=${PROXMOX_TOKEN_SECRET}"
tofu apply --auto-approve -var-file=${JENKINS_VARS} -var="proxmox_token_id=${PROXMOX_TOKEN_ID}" -var="proxmox_token_secret=${PROXMOX_TOKEN_SECRET}"
echo "Moving inventory YAML to inventory location in ansible"
cp inventory_dev.yaml $initialLocation/${JENKINS_PLATFORM_ANSIBLE}/inventory/ci/

cd $initialLocation
cd jenkins

echo "Running ansible"

ansible-playbook site.yml --extra-vars "cluster_ssh_key=${SERVER_SSH_KEY} ansible_sudo_pass=$CLUSTER_PASSWORD git_user=${GITHUB_USERNAME} git_token=${GITHUB_TOKEN}"

