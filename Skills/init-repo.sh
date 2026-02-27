#!/bin/bash

# Default name is the current directory name if flag is not provided
REPO_NAME=$(basename "$PWD")

# Parse flags
while getopts "n:" opt; do
  case $opt in
    n) REPO_NAME="$OPTARG" ;;
    *) echo "Usage: $0 [-n repo_name]" >&2
       exit 1 ;;
  esac
done

echo "🚀 Initializing private repo: $REPO_NAME"

# 1. Initialize local git if not already done
if [ ! -d ".git" ]; then
    git init
    # Add all files and create an initial commit (required to push)
    git add .
    git commit -m "Initial commit"
else
    echo "✔ Local Git already initialized."
fi

# 2. Use GH CLI to create the repo and link it
# --private: Sets visibility
# --source=.: Uses current directory
# --remote=origin: Sets up the git remote automatically
# --push: Pushes the current branch to the new remote
gh repo create "$REPO_NAME" --private --source=. --remote=origin --push

if [ $? -eq 0 ]; then
    echo "✅ Successfully created and pushed to https://github.com/YOUR_USER/$REPO_NAME"
else
    echo "❌ Failed to create repository."
    exit 1
fi