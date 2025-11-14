#!/bin/bash

# Install PostgreSQL
echo "Installing PostgreSQL..."
sudo apt update
sudo apt install -y postgresql postgresql-contrib php-pgsql

# Start PostgreSQL service
echo "Starting PostgreSQL service..."
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Create database and user
echo "Creating database and user..."
sudo -u postgres psql <<EOF
CREATE DATABASE krayin_crm;
CREATE USER krayin WITH PASSWORD 'krayin123';
GRANT ALL PRIVILEGES ON DATABASE krayin_crm TO krayin;
\q
EOF

# Update .env file
echo "Updating .env configuration..."
sed -i 's/DB_CONNECTION=.*/DB_CONNECTION=pgsql/' .env
sed -i 's/DB_HOST=.*/DB_HOST=localhost/' .env
sed -i 's/DB_PORT=.*/DB_PORT=5432/' .env
sed -i 's/DB_DATABASE=.*/DB_DATABASE=krayin_crm/' .env
sed -i 's/DB_USERNAME=.*/DB_USERNAME=krayin/' .env
sed -i 's/DB_PASSWORD=.*/DB_PASSWORD=krayin123/' .env

# Install Krayin CRM
echo "Installing Krayin CRM..."
php artisan krayin-crm:install

# Run the application
echo "Starting the application..."
php artisan serve
