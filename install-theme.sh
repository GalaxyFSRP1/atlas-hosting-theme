#!/bin/bash

# Atlas Hosting Pterodactyl Theme Installer

set -e

echo "Installing Atlas Hosting Blueprint Theme..."

# Absolute path to Pterodactyl panel directory (edit if needed)
PANEL_DIR="/var/www/pterodactyl"

# Copy logo and favicon
cp public/logo.png "$PANEL_DIR/public/logo.png"
cp public/favicon.ico "$PANEL_DIR/public/favicon.ico"

# Copy custom CSS
cp resources/css/atlas-blueprint.css "$PANEL_DIR/public/themes/atlas-blueprint.css"

# Overwrite Blade templates
cp resources/views/auth/login.blade.php "$PANEL_DIR/resources/views/auth/login.blade.php"
cp resources/views/layouts/sidebar.blade.php "$PANEL_DIR/resources/views/layouts/sidebar.blade.php"
cp resources/views/layouts/navbar.blade.php "$PANEL_DIR/resources/views/layouts/navbar.blade.php"

# Add stylesheet reference to main layout (if not present)
if ! grep -q "atlas-blueprint.css" "$PANEL_DIR/resources/views/layouts/app.blade.php"; then
  sed -i '/<head>/a <link rel="stylesheet" href="{{ asset('themes/atlas-blueprint.css') }}">' "$PANEL_DIR/resources/views/layouts/app.blade.php"
fi

echo "Clearing cache and restarting panel..."
php "$PANEL_DIR/artisan" cache:clear
php "$PANEL_DIR/artisan" view:clear

echo "Theme installed! Please refresh your browser to see changes."