#!/bin/bash

# Install PostgreSQL
echo "Installing PostgreSQL..."
yay -S --noconfirm --needed postgresql

# Check if data directory already exists and is initialized
if [ ! -d "/var/lib/postgres/data" ] || [ -z "$(ls -A /var/lib/postgres/data 2>/dev/null)" ]; then
    echo "Initializing PostgreSQL database..."
    sudo -u postgres initdb -D /var/lib/postgres/data --locale=C.UTF-8 --encoding=UTF8 --data-checksums
else
    echo "PostgreSQL data directory already initialized, skipping..."
fi

# Start and enable PostgreSQL service
echo "Starting PostgreSQL service..."
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Wait for PostgreSQL to be ready
sleep 2

# Create a database user matching the current user if it doesn't exist
echo "Setting up PostgreSQL user..."
if ! sudo -u postgres psql -tAc "SELECT 1 FROM pg_user WHERE usename='$USER'" | grep -q 1; then
    sudo -u postgres createuser --interactive -d "$USER"
    echo "Created PostgreSQL user: $USER"
else
    echo "PostgreSQL user $USER already exists"
fi

# Create a default database for the user if it doesn't exist
if ! sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -qw "$USER"; then
    createdb "$USER"
    echo "Created default database: $USER"
else
    echo "Database $USER already exists"
fi

echo "PostgreSQL installation and setup complete!"
echo "You can now connect to PostgreSQL using: psql"