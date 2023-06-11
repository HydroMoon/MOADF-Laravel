#!/bin/sh

# Copy sshd_config file
mv /prepare/ssh_config/sshd_config /etc/ssh/sshd_config

# Preparing daemonized apps
mkdir /etc/service/${WEB_SERVER} \
    /etc/service/php \
    /etc/service/laravel \
    /etc/service/startup

# Copy needed file to run the daemons
cp /daemons/${WEB_SERVER} /etc/service/${WEB_SERVER}/run
cp /daemons/php /etc/service/php/run
cp /daemons/laravel /etc/service/laravel/run
cp /daemons/startup /etc/service/startup/run

# Make them executables
find /etc/service/ -type f -name "run" -exec chmod +x {} \;

# Copy artisan & composer script to /usr/local/bin
# mv /prepare/artisan.sh /usr/local/bin/artisan
# mv /prepare/composer.sh /usr/local/bin/composer
# chmod +x /usr/local/bin/artisan /usr/local/bin/composer

# Copy php config files & php fpm pool setting if needed
mv /prepare/php/php.config.ini /usr/local/etc/php/conf.d/php.config.ini
mv /prepare/php/php.pool.conf /usr/local/etc/php-fpm.d/z-php.pool.conf

# Add sudo and allow to run it without password
install_clean sudo
echo "$user ALL=(ALL:ALL) NOPASSWD: ALL" | tee "/etc/sudoers.d/dont-prompt-$user-for-sudo-password"
# Disable php opcache for developement
sed -i 's/opcache.enable=1/opcache.enable=0/g' /usr/local/etc/php/conf.d/opcache.ini

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

mkdir -p /var/app/storage/logs
mkdir -p /var/app/storage/app
chgrp -R 33 /var/app/storage
chmod -R ug+rwx /var/app/storage
chmod -R 777 /var/app/storage