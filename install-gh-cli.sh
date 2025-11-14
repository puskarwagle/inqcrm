#!/bin/bash

# Install GitHub CLI

echo "Installing GitHub CLI..."

# Install GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh -y

echo ""
echo "✓ GitHub CLI installed!"
echo ""
echo "Now authenticate with GitHub:"
echo "  gh auth login"
echo ""
echo "Then create and push repository:"
echo "  gh repo create laravel-crm --private --source=. --remote=origin --push"
