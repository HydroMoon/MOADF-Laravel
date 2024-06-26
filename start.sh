#!/bin/bash

function baseimage
{
    echo -e '\033[0;33m'"Base image selection:"
    echo -e '\033[0;32m'"\n 1) PHP8.1-FPM"
    echo -e " 2) PHP8.0-FPM"
    echo -e " 3) PHP7.4-FPM"'\033[0m'
    echo -e "\n"
    read -p "Your choice: " php_version
}

function webserverchoice
{
    echo -e '\033[0;33m'"Web server selection: (Both have PHP-FPM enabled)"
    echo -e '\033[0;32m'"\n 1) NGINX"
    echo -e " 2) Apache"'\033[0m'
    echo -e "\n"
    read -p "Your choice: " webserver
}

function composerversionchoice
{
    echo -e '\033[0;34m'"Its is recommended to use the latest version of composer as it is proven to be blazing fast when installing/updating dependencies"
    echo -e '\033[0;34m'"Unless it is requisite to use the old version by a dependency just *Do not use it*"
    echo -e '\033[0;33m'"Composer version selection:"
    echo -e '\033[0;32m'"\n 1) Composer 2.4.1"
    echo -e " 2) Composer 2"
    echo -e " 3) Composer 1.10.26"'\033[0m'
    echo -e "\n"
    read -p "Your choice: " composerversion
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
rm -rf MOADF-Laravel/.git MOADF-Laravel/README.md 
mv MOADF-Laravel/* ./
mv MOADF-Laravel/.dockerignore ./.dockerignore
rm -rf MOADF-Laravel

echo -e "Done cloning"
echo -e "\nLanching interactive shell\n"

baseimage
filename=Dockerfile.laravel
case $php_version in
  1)
    echo -e "You selected: PHP8.1-FPM"
    php_version="php-8.1"
    ;;

  2)
    echo -e "You selected: PHP8.0-FPM"
    php_version="php-8.0"
    ;;

  3)
    echo -e "You selected: PHP7.4-FPM"
    php_version="php-7.4"
    ;;

  *)
    baseimage
    ;;
esac
echo -e "\n"
webserverchoice

case $webserver in

  1)
    echo -e "You selected: NGINX"
    webserver="nginx"
    ;;

  # 2)
  #   echo -e "You selected: Apache"
  #   webserver="apache"
  #   ;;

  *)
    webserverchoice
    ;;
esac
composerversionchoice

case $composerversion in

  1)
    echo -e "You selected: Composer version 2.4.1"
    composerversion="2.4.1"
    ;;

  2)
    echo -e "You selected: Composer version 2"
    composerversion="2"
    ;;
  
  3)
    echo -e "You selected: Composer version 1.10.26"
    composerversion="1.10.26"
    ;;

  *)
    composerversionchoice
    ;;
esac

echo -e "\nConfiguring Dockerfile for you..."
php start.php $php_version $webserver $composerversion

rm start.php start.sh

echo -e "\nKeep in mind there is other configuration needed if you want to enable SSH access, cron jobs or you have any other custom configs you want to add for full info please visit github https://github.com/HydroMoon/MOADF-Laravel"
echo -e "\nDone... Thanks for using MOADF for Laravel <3 - created by Qasim Nouh - https://qasimnouh.com"