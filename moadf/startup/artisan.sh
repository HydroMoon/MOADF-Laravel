#!/bin/sh
# Startup script for optimizing and setting up laravel
cd /var/app
# composer update
# artisan key:generate
artisan clear-compiled
composer dump-autoload
# artisan cache:clear
# artisan route:clear
# artisan config:clear
# artisan view:clear
artisan optimize
artisan storage:link
