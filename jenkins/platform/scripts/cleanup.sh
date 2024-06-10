#! /bin/bash/env bash

export ENV=$1

export SECRETS_FILE=~/.personal_vault/todopoderoso
export JENKINS_PLATFORM_INFRA=jenkins/platform/infra/
## TODO change path to be more absolute. right now the assumption is that the .tfvars are inside `jenkins/platform` folder.
export JENKINS_VARS=env/${ENV}/tofu.tfvars

echo "Cleaning up Infra"

echo "sourcing secrets..."
source $SECRETS_FILE


echo "Initializing opentofu"
tofu init
initialLocation=$(pwd)
cd $JENKINS_PLATFORM_INFRA
tofu destroy --auto-approve -var-file=${JENKINS_VARS} -var="proxmox_token_id=${PROXMOX_TOKEN_ID}" -var="proxmox_token_secret=${PROXMOX_TOKEN_SECRET}"


