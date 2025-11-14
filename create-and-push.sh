#!/bin/bash

# Simple GitHub push script

GITHUB_USERNAME="puskarwagl"
REPO_NAME="krayin-crm-inq"

echo "Creating GitHub repository and pushing..."
echo ""

# Remove old origin
echo "Removing old origin..."
git remote remove origin 2>/dev/null || echo "No old origin to remove"

# Add new origin
NEW_REMOTE="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
echo "Adding new remote: $NEW_REMOTE"
git remote add origin "$NEW_REMOTE"

echo ""
echo "Now you need to:"
echo "1. Go to https://github.com/new"
echo "2. Repository name: $REPO_NAME"
echo "3. Make it Private or Public (your choice)"
echo "4. DO NOT add README, .gitignore, or license"
echo "5. Click 'Create repository'"
echo ""
read -p "Press Enter once you've created the repository on GitHub..."

echo ""
echo "Pushing to GitHub..."
git push -u origin 2.1

echo ""
echo "✓ Done! Repository URL:"
echo "  https://github.com/$GITHUB_USERNAME/$REPO_NAME"
