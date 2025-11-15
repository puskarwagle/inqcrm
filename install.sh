#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Helper Functions ---

# Function to print a formatted header.
print_header() {
    echo ""
    echo "===================================================================="
    echo " $1"
    echo "===================================================================="
}

# Function to check if a command exists.
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# --- OS-Specific Dependency Installation ---

install_dependencies_linux() {
    print_header "Installing dependencies for Ubuntu"
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    
    # Add PPA for latest PHP versions
    if ! grep -q "ondrej/php" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
        echo "Adding PHP PPA..."
        sudo add-apt-repository ppa:ondrej/php -y
        sudo apt-get update
    fi

    # Install PHP 8.4 and extensions
    echo "Installing PHP 8.4 and required extensions..."
    sudo apt-get install -y php8.4 php8.4-cli php8.4-mysql php8.4-xml php8.4-curl php8.4-mbstring php8.4-dom php8.4-zip php8.4-gd

    # Install MySQL Server
    if ! command_exists mysql; then
        echo "Installing MySQL Server..."
        sudo apt-get install -y mysql-server
        echo "Please follow the prompts to secure your MySQL installation."
        sudo mysql_secure_installation
    fi

    # Install Composer
    if ! command_exists composer; then
        echo "Installing Composer..."
        php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
        sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
        php -r "unlink('composer-setup.php');"
    fi
}

install_dependencies_macos() {
    print_header "Installing dependencies for macOS"

    # Check for Homebrew
    if ! command_exists brew; then
        echo "Homebrew not found. Please install it first by running:"
        echo '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
        exit 1
    fi

    brew update

    # Install PHP 8.2
    if ! brew list php@8.2 &>/dev/null; then
        echo "Installing PHP 8.2..."
        brew install php@8.2
    fi
    echo 'export PATH="/usr/local/opt/php@8.2/bin:$PATH"' >> ~/.zshrc
    echo 'export PATH="/usr/local/opt/php@8.2/sbin:$PATH"' >> ~/.zshrc
    source ~/.zshrc

    # Install MySQL
    if ! brew list mysql &>/dev/null; then
        echo "Installing MySQL..."
        brew install mysql
        echo "Starting MySQL service..."
        brew services start mysql
    fi

    # Install Composer
    if ! command_exists composer; then
        echo "Installing Composer..."
        brew install composer
    fi
}

# --- Main Script ---

print_header "Krayin CRM Installation Script"
echo "This script will guide you through the installation of Krayin CRM."

# 1. Detect Operating System
OS=""
if [[ "$(uname)" == "Linux" ]]; then
    OS="Linux"
    install_dependencies_linux
elif [[ "$(uname)" == "Darwin" ]]; then
    OS="macOS"
    install_dependencies_macos
else
    echo "Unsupported operating system. This script supports Ubuntu and macOS."
    exit 1
fi

# 2. Setup Database
print_header "Setting up MySQL Database"
DB_NAME="krayin_crm"
DB_USER="krayin_user"
DB_PASS=$(openssl rand -base64 12)

echo "Please enter your MySQL root password to create the database and user."
read -sp "MySQL root password: " ROOT_PASSWORD
echo ""

echo "Creating database '$DB_NAME' and user '$DB_USER'..."
# Use a temporary file for credentials to avoid warnings
cat > ~/.my.cnf.tmp <<EOF
[client]
user=root
password="$ROOT_PASSWORD"
EOF

mysql --defaults-extra-file=~/.my.cnf.tmp -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql --defaults-extra-file=~/.my.cnf.tmp -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';"
mysql --defaults-extra-file=~/.my.cnf.tmp -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"
mysql --defaults-extra-file=~/.my.cnf.tmp -e "FLUSH PRIVILEGES;"

rm ~/.my.cnf.tmp
echo "Database setup complete."

# 3. Configure Laravel Application
print_header "Configuring Laravel (.env)"
if [ ! -f ".env" ]; then
    echo "Copying .env.example to .env..."
    cp .env.example .env
fi

# Use a temporary file for sed on macOS
SED_INPLACE="sed -i"
if [[ "$OS" == "macOS" ]]; then
    SED_INPLACE="sed -i ''"
fi

$SED_INPLACE "s/DB_CONNECTION=.*/DB_CONNECTION=mysql/" .env
$SED_INPLACE "s/DB_HOST=.*/DB_HOST=127.0.0.1/" .env
$SED_INPLACE "s/DB_PORT=.*/DB_PORT=3306/" .env
$SED_INPLACE "s/DB_DATABASE=.*/DB_DATABASE=$DB_NAME/" .env
$SED_INPLACE "s/DB_USERNAME=.*/DB_USERNAME=$DB_USER/" .env
$SED_INPLACE "s/DB_PASSWORD=.*/DB_PASSWORD=$DB_PASS/" .env

echo ".env file configured."

# 4. Install Application Dependencies and Run Setup
print_header "Installing Krayin CRM"

echo "Installing Composer dependencies..."
composer install --no-interaction --prefer-dist --optimize-autoloader

echo "Generating application key..."
php artisan key:generate

echo "Running Krayin CRM installation (migrations, seeding, etc.)..."
php artisan krayin-crm:install

# 5. Update Admin Password
print_header "Setting Admin Password"
echo "Setting password for 'admin@example.com' to 'admin123'..."
php artisan tinker --execute="\App\Models\User::where('email', 'admin@example.com')->first()->update(['password' => \Illuminate\Support\Facades\Hash::make('admin123')])"
echo "Admin password updated."

# 6. Final Instructions
print_header "Installation Complete!"
echo "Krayin CRM has been successfully installed."
echo ""
echo "Admin Login Details:"
echo "  URL: http://127.0.0.1:8000/admin/login"
echo "  Email: admin@example.com"
echo "  Password: admin123"
echo ""
echo "To start the application, run the following command:"
echo "  php artisan serve"
echo ""

exit 0
