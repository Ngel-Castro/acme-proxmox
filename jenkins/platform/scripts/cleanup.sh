#! /bin/bash/env bash

export SECRETS_FILE=~/.personal_vault/todopoderoso
export JENKINS_PLATFORM_INFRA=jenkins/platform/infra/
## TODO change path to be more absolute. right now the assumption is that the .tfvars are inside `jenkins/platform` folder.
export JENKINS_DEVEL_VARS=env/development/tofu.tfvars

echo "Cleaning up Infra"

echo "sourcing secrets..."
source $SECRETS_FILE


echo "Initializing opentofu"
initialLocation=$(pwd)
cd $JENKINS_PLATFORM_INFRA
tofu destroy --auto-approve -var-file=${JENKINS_DEVEL_VARS} -var="proxmox_token_id=${PROXMOX_TOKEN_ID}" -var="proxmox_token_secret=${PROXMOX_TOKEN_SECRET}"


