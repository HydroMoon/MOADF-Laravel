#!/bin/sh
# Add env varriables
echo /tmp > /etc/container_environment/COMPOSER_HOME
echo -1 > /etc/container_environment/COMPOSER_MEMORY_LIMIT
# Copy artisan script to /usr/local/bin
mv /prepare/artisan.sh /usr/local/bin/artisan
mv /prepare/composer.sh /usr/local/bin/composer
chmod +x /usr/local/bin/artisan /usr/local/bin/composer
# Copy php config files
mv /prepare/php.config.ini /usr/local/etc/php/conf.d/php.config.ini
# Prepare web server config according to build args
if [ $WEB_SERVER = "nginx" ]; then
install_clean nginx
cp /prepare/default.nginx.prod.conf /etc/nginx/sites-enabled/default
else
install_clean apache2
echo "ServerName localhost" >> /etc/apache2/apache2.conf
echo "Mutex posixsem" >> /etc/apache2/apache2.conf
cp /prepare/default.apache.prod.conf /etc/apache2/sites-enabled/000-default.conf
a2enmod actions
a2enmod rewrite
a2enmod proxy_fcgi
fi