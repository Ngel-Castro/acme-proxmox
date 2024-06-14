#! /bin/bash/env bash

export ENV=$1

export SECRETS_FILE=.env
export JENKINS_PLATFORM_INFRA=jenkins/platform/infra/
## TODO change path to be more absolute. right now the assumption is that the .tfvars are inside `jenkins/platform` folder.
export JENKINS_VARS=env/${ENV}/tofu.tfvars

echo "Cleaning up Infra"

echo "sourcing secrets..."
source $SECRETS_FILE

echo "Initializing opentofu"
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
initialLocation=$(pwd)
tofu destroy --auto-approve -var-file=${JENKINS_VARS} -var="proxmox_token_id=${PROXMOX_TOKEN_ID}" -var="proxmox_token_secret=${PROXMOX_TOKEN_SECRET}"


