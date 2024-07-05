#! /bin/bash/env bash

# List of hosts to probe
hosts=($1)
ssh_key=$2

# SSH user
user="root"

# SSH options
ssh_options="-o BatchMode=yes -o ConnectTimeout=5 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

# Function to check SSH connection
check_ssh() {
  host=$1
  echo "Probing SSH connection to $host..."

  # Attempt to establish SSH connection
  ssh -i ${ssh_key} $ssh_options "$user@$host" exit

  if [ $? -eq 0 ]; then
    echo "SSH connection to $host successful"
    return 0
  else
    echo "SSH connection to $host failed"
    return 1
  fi
}

# Get the start time
start_time=$(date +%s)

# Run the loop for 5 minutes
while true; do
  # Check the elapsed time
  current_time=$(date +%s)
  elapsed_time=$((current_time - start_time))

  # Break the loop if 5 minutes have passed
  if [ $elapsed_time -ge 300 ]; then
    echo "5 minutes have passed. Exiting..."
    break
  fi

  all_passed=true

  # Loop through hosts and check SSH connection
  for host in "${hosts[@]}"; do
    check_ssh $host
    if [ $? -ne 0 ]; then
      all_passed=false
    fi
  done

  # Break the loop if all hosts have passed the check
  if $all_passed; then
    echo "All hosts have passed the SSH check. Exiting..."
    break
  fi

  # Sleep for a short duration to avoid excessive CPU usage
  sleep 1
done