#!/bin/bash

echo "Installing PostgreSQL and PHP extensions..."
sudo apt update
sudo apt install -y postgresql postgresql-contrib php8.3-pgsql php8.3-intl php8.3-mbstring php8.3-xml php8.3-curl php8.3-zip php8.3-gd

echo "Starting PostgreSQL service..."
sudo systemctl start postgresql
sudo systemctl enable postgresql

echo "Creating database and setting up user..."
sudo -u postgres psql <<EOF
-- Create database
CREATE DATABASE inqcrm;

-- Set up wagle user (if password authentication is needed)
ALTER USER wagle WITH PASSWORD 'wagle';

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE inqcrm TO wagle;
ALTER DATABASE inqcrm OWNER TO wagle;

\q
EOF

echo "Database setup complete!"
echo "You can now run: php artisan krayin-crm:install"
