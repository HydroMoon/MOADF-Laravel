#!/bin/sh
# Startup script for optimizing and setting up laravel
cd /var/app
export COMPOSER_HOME=/var/composer/.composer
export COMPOSER_MEMORY_LIMIT=-1 
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
