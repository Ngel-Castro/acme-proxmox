#! /bin/bash/env bash
export ENV=$1

export SECRETS_FILE=.env
export JENKINS_PLATFORM_INFRA=jenkins/platform/infra/
export JENKINS_PLATFORM_ANSIBLE=platform/ansible/
## TODO change path to be more absolute. right now the assumption is that the .tfvars are inside `jenkins/platform` folder.
export JENKINS_VARS=env/${ENV}/tofu.tfvars
export SERVER_SSH_KEY=~/.ssh/cluster_alma
export ADMIN_SSH_KEY=~/.ssh/cluster_alma

echo "Bootstrapping Jenkins"

echo "sourcing secrets..."
source $SECRETS_FILE

echo "Initializing opentofu"
initialLocation=$(pwd)
cd $JENKINS_PLATFORM_INFRA
tofu init

export WORKSPACE_NAME=$ENV

# Check if the workspace already exists
if tofu workspace list | grep -q "$WORKSPACE_NAME"; then
  echo "Workspace $WORKSPACE_NAME already exists. Selecting it."
  tofu workspace select "$WORKSPACE_NAME"
else
  echo "Workspace $WORKSPACE_NAME does not exist. Creating it."
  tofu workspace new "$WORKSPACE_NAME"
fi

echo "Deploying infrastructure"
tofu plan -var-file=${JENKINS_VARS} -var="proxmox_token_id=${PROXMOX_TOKEN_ID}" -var="proxmox_token_secret=${PROXMOX_TOKEN_SECRET}"
tofu apply --auto-approve -var-file=${JENKINS_VARS} -var="proxmox_token_id=${PROXMOX_TOKEN_ID}" -var="proxmox_token_secret=${PROXMOX_TOKEN_SECRET}"
echo "Moving inventory YAML to inventory location in ansible"
cp inventory_${ENV}.yaml $initialLocation/jenkins/${JENKINS_PLATFORM_ANSIBLE}/inventory/ci/

cd $initialLocation
cd jenkins

echo "Running ansible"
export INVENTORY_FILE=${JENKINS_PLATFORM_ANSIBLE}/inventory/ci/inventory_${ENV}.yaml

ansible-playbook site.yml -i ${INVENTORY_FILE} --extra-vars "cluster_ssh_key=${SERVER_SSH_KEY} ansible_sudo_pass=$CLUSTER_PASSWORD git_user=${GITHUB_USERNAME} git_token=${GITHUB_TOKEN} proxmox_token_id=${PROXMOX_TOKEN_ID} proxmox_token_secret=${PROXMOX_TOKEN_SECRET} ssh_admin_key_path=${ADMIN_SSH_KEY}"

