#!/bin/bash

DB_NAME="inqcrm"
DB_USER="wagle"
DB_PASSWORD="wagle"

echo "Resetting PostgreSQL database..."

# Change to /tmp to avoid permission issues
cd /tmp

# Terminate existing connections
echo "Terminating existing connections..."
sudo -u postgres psql -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '$DB_NAME' AND pid <> pg_backend_pid();"

# Drop and recreate database
echo "Dropping database if exists..."
sudo -u postgres psql -c "DROP DATABASE IF EXISTS $DB_NAME;"

echo "Creating fresh database..."
sudo -u postgres psql -c "CREATE DATABASE $DB_NAME OWNER $DB_USER;"

# Grant privileges
echo "Granting privileges..."
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;"

# Grant schema privileges
echo "Granting schema privileges..."
sudo -u postgres psql -d $DB_NAME -c "GRANT ALL ON SCHEMA public TO $DB_USER;"

echo "✓ Database reset complete!"
echo ""
echo "Now run: cd ~/inquisitive_mind/laravel-crm && php artisan krayin-crm:install"
