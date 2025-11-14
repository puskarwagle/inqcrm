#!/bin/bash

# PostgreSQL Database Setup Script for Krayin CRM

DB_NAME="inqcrm"
DB_USER="wagle"
DB_PASSWORD="wagle"

echo "Setting up PostgreSQL database..."

# Create database
echo "Creating database: $DB_NAME"
sudo -u postgres createdb $DB_NAME 2>/dev/null || echo "Database may already exist"

# Create user
echo "Creating user: $DB_USER"
sudo -u postgres psql -c "CREATE USER $DB_USER WITH PASSWORD '$DB_PASSWORD';" 2>/dev/null || echo "User may already exist"

# Grant privileges
echo "Granting privileges..."
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;"

# Set database owner
echo "Setting database owner..."
sudo -u postgres psql -c "ALTER DATABASE $DB_NAME OWNER TO $DB_USER;"

# Grant schema privileges (required for PostgreSQL)
echo "Granting schema privileges..."
sudo -u postgres psql -d $DB_NAME -c "GRANT ALL ON SCHEMA public TO $DB_USER;"
sudo -u postgres psql -d $DB_NAME -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO $DB_USER;"
sudo -u postgres psql -d $DB_NAME -c "GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO $DB_USER;"

echo "✓ Database setup complete!"
echo ""
echo "Database: $DB_NAME"
echo "User: $DB_USER"
echo "Password: $DB_PASSWORD"
echo ""
echo "Now run: php artisan krayin-crm:install"
