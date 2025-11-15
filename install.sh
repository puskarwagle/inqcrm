#!/bin/bash

# This script automates the installation of necessary components for a Laravel application
# on a Debian/Ubuntu-based system.
# It assumes you have sudo privileges.

echo "Starting installation process..."

# 1. Update package list
echo "Updating package list..."
sudo apt update || { echo "Failed to update package list. Exiting."; exit 1; }

# 2. Install PHP and common extensions required by Laravel
echo "Installing PHP and common extensions..."
# Adjust PHP version if needed, e.g., php8.2-fpm, php8.2-mysql, etc.
sudo apt install -y php-cli php-fpm php-mysql php-mbstring php-xml php-bcmath php-zip php-json php-common php-curl php-gd || { echo "Failed to install PHP extensions. Exiting."; exit 1; }

# 3. Install Composer (PHP Dependency Manager)
echo "Installing Composer..."
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" || { echo "Failed to download Composer installer. Exiting."; exit 1; }
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ffce0319d82357af63d9be57a2df198f9ac3e70c1a99787c67bd89ab8734cf587c0cf0b3dfd8a6c79ff72') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); exit(1); } echo PHP_EOL;" || { echo "Composer installer verification failed. Exiting."; exit 1; }
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer || { echo "Failed to install Composer. Exiting."; exit 1; }
php -r "unlink('composer-setup.php');"

# 4. Install MySQL Server (or your preferred database server)
echo "Installing MySQL Server..."
sudo apt install -y mysql-server || { echo "Failed to install MySQL Server. Exiting."; exit 1; }

# 5. Install Node.js and npm (for frontend dependencies)
echo "Installing Node.js and npm..."
# Using NodeSource PPA for a recent version
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - || { echo "Failed to add NodeSource PPA. Exiting."; exit 1; }
sudo apt install -y nodejs || { echo "Failed to install Node.js. Exiting."; exit 1; }

echo "--- Application Specific Setup ---"

# 6. Install PHP dependencies
echo "Installing PHP dependencies with Composer..."
composer install || { echo "Failed to install PHP dependencies. Exiting."; exit 1; }

# 7. Install Node.js dependencies
echo "Installing Node.js dependencies with npm..."
npm install || { echo "Failed to install Node.js dependencies. Exiting."; exit 1; }

# 8. Copy environment file
echo "Copying .env.example to .env..."
cp .env.example .env || { echo "Failed to copy .env.example. Exiting."; exit 1; }

# 9. Generate application key
echo "Generating application key..."
php artisan key:generate || { echo "Failed to generate application key. Exiting."; exit 1; }

# 10. Configure your .env file (IMPORTANT: You'll need to edit this manually)
echo "---------------------------------------------------------------------"
echo "IMPORTANT: Please configure your .env file with database credentials."
echo "           You can do this by running 'nano .env' or your preferred editor."
echo "           Set DB_DATABASE, DB_USERNAME, DB_PASSWORD, etc."
echo "---------------------------------------------------------------------"

# 11. Run database migrations
echo "Running database migrations..."
php artisan migrate || { echo "Failed to run database migrations. Exiting."; exit 1; }

echo "Installation script finished. Please configure your .env file and then you should be ready to serve the application."