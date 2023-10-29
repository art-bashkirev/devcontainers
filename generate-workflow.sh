#!/bin/bash

# Create the workflow file
echo "name: Build Dev Containers
on:
  push:
    branches:
      - main

jobs:
  build-devcontainers:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: Set up Node.js
        uses: actions/setup-node@v2
        with:
          node-version: '14'

      - name: Install Dev Containers CLI
        run: npm install -g @devcontainers/cli"

# Get the list of Dev Container folders
devcontainerFolders="devcontainers/*/"

# Generate the workflow steps for each Dev Container
for folder in $devcontainerFolders; do
  folder=${folder%*/}  # Remove trailing slash
  folderName=$(basename "$folder")

  echo "
      - name: Build Dev Container: $folderName
        run: devcontainer build --workspace-folder $folder --config $folder/.devcontainer/devcontainer.json --image-name artba/codespace:\$\{github.sha\} --image-name artba/codespace:latest"
done

# Save the workflow file
echo "" > .github/workflows/build-devcontainers.yml
chmod +x .github/workflows/build-devcontainers.yml

# Run the GitHub Actions workflow command
git add .github/workflows/build-devcontainers.yml
