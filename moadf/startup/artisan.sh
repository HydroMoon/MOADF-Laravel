#!/bin/sh
# Startup script for optimizing and setting up laravel
cd /var/app
artisan key:generate
artisan clear-compiled
COMPOSER_HOME=/var/composer/.composer composer dump-autoload
artisan storage:link
# artisan optimize