#!/bin/sh
# Startup script for optimizing and setting up laravel
cd /var/app
# php artisan key:generate
php artisan clear-compiled 
composer dump-autoload
php artisan storage:link
php artisan optimize