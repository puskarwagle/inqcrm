#!/bin/bash

# Install required PHP extensions
echo "Installing PHP extensions..."
sudo apt update
sudo apt install -y php8.3-intl php8.3-pgsql php8.3-mbstring php8.3-xml php8.3-curl php8.3-zip php8.3-gd

# Install and configure PostgreSQL
echo "Installing PostgreSQL..."
sudo apt install -y postgresql postgresql-contrib

# Start PostgreSQL
echo "Starting PostgreSQL..."
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Create database and user
echo "Creating database..."
sudo -u postgres psql <<EOF
CREATE DATABASE krayin_crm;
CREATE USER krayin WITH PASSWORD 'krayin123';
GRANT ALL PRIVILEGES ON DATABASE krayin_crm TO krayin;
ALTER DATABASE krayin_crm OWNER TO krayin;
\q
EOF

echo "Done! PHP extensions and PostgreSQL installed."
