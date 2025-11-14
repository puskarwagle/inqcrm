#!/bin/bash

# Setup PostgreSQL database for Krayin CRM
echo "Setting up PostgreSQL database..."

# Create database and configure user
sudo -u postgres psql <<EOF
-- Create database
CREATE DATABASE inqcrm;

-- Grant privileges to wagle user (assuming user exists)
GRANT ALL PRIVILEGES ON DATABASE inqcrm TO wagle;
ALTER DATABASE inqcrm OWNER TO wagle;

-- If wagle user doesn't exist, create it (uncomment and set password)
-- CREATE USER wagle WITH PASSWORD 'your_password';
-- GRANT ALL PRIVILEGES ON DATABASE inqcrm TO wagle;
-- ALTER DATABASE inqcrm OWNER TO wagle;

\q
EOF

echo "Database setup complete!"
echo "Note: PostgreSQL default port is 5432, not 3306"
