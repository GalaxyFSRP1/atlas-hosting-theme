#!/bin/bash

# Atlas Hosting Pterodactyl Theme Installer

set -e

echo "Pulling latest theme files from repo..."
git pull

echo "Installing Atlas Hosting Blueprint Theme..."

# Absolute path to Pterodactyl panel directory
PANEL_DIR="/var/www/pterodactyl"

# Ensure target directories exist
sudo mkdir -p "$PANEL_DIR/public"
sudo mkdir -p "$PANEL_DIR/public/themes"
sudo mkdir -p "$PANEL_DIR/resources/views/blueprint"
sudo mkdir -p "$PANEL_DIR/resources/views/blueprint/admin"
sudo mkdir -p "$PANEL_DIR/resources/views/blueprint/dashboard"
sudo mkdir -p "$PANEL_DIR/resources/views/blueprint/extensions"


# Copy custom CSS
cp resources/css/atlas-blueprint.css "$PANEL_DIR/public/themes/atlas-blueprint.css"

# Overwrite Blade templates in blueprint
cp resources/views/auth/login.blade.php "$PANEL_DIR/resources/views/blueprint/dashboard/login.blade.php"
cp resources/views/layouts/sidebar.blade.php "$PANEL_DIR/resources/views/blueprint/dashboard/sidebar.blade.php"
cp resources/views/layouts/navbar.blade.php "$PANEL_DIR/resources/views/blueprint/dashboard/navbar.blade.php"

# Add stylesheet reference to main Blueprint layout (if not present)
if ! grep -q "atlas-blueprint.css" "$PANEL_DIR/resources/views/blueprint/dashboard/app.blade.php"; then
  sed -i '/<head>/a <link rel="stylesheet" href="{{ asset('themes/atlas-blueprint.css') }}">' "$PANEL_DIR/resources/views/blueprint/dashboard/app.blade.php"
fi

echo "Clearing cache and restarting panel..."
php "$PANEL_DIR/artisan" cache:clear
php "$PANEL_DIR/artisan" view:clear

echo "Theme installed! Please refresh your browser to see changes."
