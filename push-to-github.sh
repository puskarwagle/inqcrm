#!/bin/bash

# GitHub repository setup script

echo "GitHub Repository Setup"
echo "======================="
echo ""
echo "First, create a new repository on GitHub:"
echo "1. Go to https://github.com/new"
echo "2. Repository name: laravel-crm (or your preferred name)"
echo "3. Make it Private or Public"
echo "4. DO NOT initialize with README, .gitignore, or license"
echo "5. Click 'Create repository'"
echo ""
read -p "Enter your GitHub username: " GITHUB_USERNAME
read -p "Enter your repository name (e.g., laravel-crm): " REPO_NAME

# Remove old remote
echo ""
echo "Removing old remote..."
git remote remove origin

# Add new remote
NEW_REMOTE="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"
echo "Adding new remote: $NEW_REMOTE"
git remote add origin "$NEW_REMOTE"

# Stage all changes
echo "Staging changes..."
git add .

# Create commit
echo "Creating commit..."
git commit -m "Initial commit: Krayin CRM with PostgreSQL support

- Fixed PostgreSQL compatibility in migrations
- Updated lead_pipeline_stages migration for PostgreSQL
- Fixed duplicate key issues in attribute migrations
- Added database setup scripts"

# Push to GitHub
echo ""
echo "Pushing to GitHub..."
git push -u origin 2.1

echo ""
echo "✓ Done! Your repository is now on GitHub:"
echo "  https://github.com/$GITHUB_USERNAME/$REPO_NAME"
