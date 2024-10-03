#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Check if an organization name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <organization>"
  exit 1
fi

org="$1"
base_dir="/c/devops"

# Create the organization directory if it doesn't exist
if [ ! -d "$base_dir/$org" ]; then
  mkdir -p "$base_dir/$org"
fi

cd "$base_dir/$org"

# Get the list of repositories
repos=$(gh repo list "$org" --limit 1000 | awk '{print $1}' | awk -F'/' '{print $2}')

# Loop through each repository
for r in $repos; do
  echo "Processing repository: $r"
  if [ -d "$r" ]; then
    cd "$r"
    git pull
    cd ..
  else
    gh repo clone "$org/$r"
  fi
done
