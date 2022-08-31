#!/bin/bash

function baseimage
{
    echo -e '\033[0;33m'"Base image selection:"
    echo -e '\033[0;32m'"\n a) PHP8.1-FPM"
    echo -e " b) PHP7.4-FPM"'\033[0m'
    echo -e "\n"
    read -p "Your choice: " php_version
}

function webserverchoice
{
    echo -e '\033[0;33m'"Web server selection: (Both have PHP-FPM enabled)"
    echo -e '\033[0;32m'"\n a) NGINX"
    echo -e " b) Apache"'\033[0m'
    echo -e "\n"
    read -p "Your choice: " webserver
}

echo -e '\033[0;34m
 _______  _______  _______  ______   _______ 
(       )(  ___  )(  ___  )(  __  \ (  ____ \
| () () || (   ) || (   ) || (  \  )| (    \/
| || || || |   | || (___) || |   ) || (__    
| |(_)| || |   | ||  ___  || |   | ||  __)   
| |   | || |   | || (   ) || |   ) || (      
| )   ( || (___) || )   ( || (__/  )| )      
|/     \|(_______)|/     \|(______/ |/       
'
echo -e '\033[0;31m' Mother Of All Docker Files - for '\033[0;32m'Laravel '\033[0;31m':D                                             
echo -e '\033[0;33m' "   Qasim Nouh - https://qasimnouh.com\n" '\033[0m'

echo -e '\033[0;34m'"Make sure you Docker BUILD_KIT is enabled for the best pereformance\n"'\033[0m'

echo -e "Cloning from repo..."
git clone -q https://github.com/HydroMoon/MOADF-Laravel.git
mv MOADF-Laravel/* ./
rm -rf MOADF-Laravel

echo -e "Done cloning"
echo -e "\nLanching interactive shell\n"

baseimage
filename=Dockerfile.laravel
case $php_version in
  a)
    echo -e "You selected: PHP8.1-FPM"
    php_version="php8.1-1.0.0"
    ;;

  b)
    echo -e "You selected: PHP7.4-FPM"
    php_version="php7.4-1.0.0"
    ;;

  *)
    baseimage
    ;;
esac
echo -e "\n"
webserverchoice

case $webserver in

  a)
    echo -e "You selected: NGINX"
    webserver="nginx"
    ;;

  b)
    echo -e "You selected: Apache"
    webserver="apache"
    ;;

  *)
    webserverchoice
    ;;
esac

echo -e "\nConfiguring Dockerfile for you..."
php start.php $php_version $webserver

rm start.php start.sh

echo -e "\nKeep in mind there is other configuration needed if you want to enable SSH access, cron jobs or you have any other custom configs you want to add for full info please visit github https://github.com/HydroMoon/MOADF-Laravel"
echo -e "\nDone... Thanks for using MOADF for Laravel <3 - created by Qasim Nouh - https://qasimnouh.com"