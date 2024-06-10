#!/bin/sh

# Customize start directory and others misc.
echo "" > /etc/motd
echo "cd /var/app" >> /etc/profile
# Add some env vars
echo "export ENABLE_CRON=$ENABLE_CRON" >> /etc/profile
echo "export INSTALL_NODE=$INSTALL_NODE" >> /etc/profile
echo "bash /prepare/init.sh" >> /etc/profile

# Copy sshd_config file and enable sshd service
mv /prepare/ssh_config/sshd_config /etc/ssh/sshd_config
rm -f /etc/service/sshd/down

# Preparing daemonized apps
mkdir /etc/service/nginx \
    /etc/service/php \
    /etc/service/startup

# Copy needed file to run the daemons
cp /daemons/nginx /etc/service/nginx/run
cp /daemons/php /etc/service/php/run
cp /daemons/startup /etc/service/startup/run

# Make them executables
find /etc/service/ -type f -name "run" -exec chmod +x {} \;

# Copy artisan & composer script to /usr/local/bin
mv /prepare/artisan.sh /usr/local/bin/artisan
mv /prepare/composer.sh /usr/local/bin/composer
chmod +x /usr/local/bin/artisan /usr/local/bin/composer

# Copy php config files & php fpm pool setting if needed
mv /prepare/php/php.config.ini /usr/local/etc/php/conf.d/custom.ini
mv /prepare/php/php.pool.conf /usr/local/etc/php-fpm.d/www.conf
mv /prepare/php/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# Setup cron and queue according to env args
if [ $ENABLE_CRON = true ]; then
# Create cron log
touch /var/log/cron.log
mkdir /etc/service/laravel
cp /daemons/laravel /etc/service/laravel/run
chmod +x /etc/service/laravel/run
mv /prepare/cron/laravel-schedule /etc/cron.d/laravel-schedule
crontab /etc/cron.d/laravel-schedule
fi

# Install node according to env args
if [ $INSTALL_NODE = true ]; then
curl -fsSL https://fnm.vercel.app/install | bash
fnm use --install-if-missing $INSTALL_NODE_VERSION
fi

install_clean nginx nginx-extras default-mysql-client git
git config --global --add safe.directory /var/app
cp /prepare/default.nginx.prod.conf /etc/nginx/sites-enabled/default
cp /prepare/default.nginx.conf /etc/nginx/nginx.conf

mkdir -p /var/app/storage/logs
mkdir -p /var/app/storage/app
chgrp -R 33 /var/app/storage
chmod -R ug+rwx /var/app/storage
chmod -R 777 /var/app/storage
